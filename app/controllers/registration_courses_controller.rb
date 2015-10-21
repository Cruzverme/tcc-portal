class RegistrationCoursesController < ApplicationController
  before_action :set_registration_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /registration_courses
  # GET /registration_courses.json
  def index
    if current_user != nil && current_user.role == 'aluno'
      @registration_courses = RegistrationCourse.all.where(aluno_id: current_user.id).order(:curso_id)
    elsif current_user != nil && (current_user.role == 'professor' || current_user.role == 'coordenador')
      @registration_courses = RegistrationCourse.joins(:curso => :disciplines).all.where("disciplines.professor_id = ?", current_user.id).order(:curso_id).group("registration_courses.id, registration_courses.curso_id")
    else
      @registration_courses = RegistrationCourse.all.order(:curso_id)
    end

    authorize @registration_courses
    #puts Time.now.strftime("%m-%d-%Y %H:%M:%S")
  end

  # GET /registration_courses/1
  # GET /registration_courses/1.json
  def show
    authorize @registration_course

    if current_user != nil && current_user.role == 'aluno'
      @registration_course = RegistrationCourse.find(params[:id])
    elsif current_user != nil && (current_user.role == 'professor' || current_user.role == 'coordenador')
      @registration_courses = Discipline.all.where(professor_id: current_user.id).order(:name)
    else
      #@registration_course = RegistrationCourse.all.order(:curso_id)
    end
  end

  # GET /registration_courses/new
  def new
    @registration_course = RegistrationCourse.new
    authorize @registration_course
  end

  # GET /registration_courses/1/edit
  def edit
    authorize @registration_course
  end

  # POST /registration_courses
  # POST /registration_courses.json
  def create
    @registration_course = RegistrationCourse.new(registration_course_params)
    authorize @registration_course

    @registration_course.locked = false
    @registration_course.admission_date = DateTime.now.to_date#Time.now.strftime("%m-%d-%Y %H:%M:%S")
    @registration_course.aluno_id = current_user.id

    respond_to do |format|
      if @registration_course.save
        format.html { redirect_to @registration_course, notice: 'Você foi matriculado com sucesso no curso.' }
        data_message = { status: true, message: "Você foi matriculado com sucesso no curso.", object: @registration_course}
        format.json { render json: data_message }
      else
        format.html { render :new }
        data_message = { status: false, message: @registration_course.errors, object: @registration_course }
        format.json  { render :json => data_message }
      end
    end
  end

  # PATCH/PUT /registration_courses/1
  # PATCH/PUT /registration_courses/1.json
  def update
    authorize @registration_course
    respond_to do |format|
      #@registration_course.conclusion_date = DateTime.now.to_date#Time.now.strftime("%m-%d-%Y %H:%M:%S")
      if @registration_course.update(registration_course_params)
        format.html { redirect_to @registration_course, notice: 'Registration course was successfully updated.' }
        format.json { render :show, status: :ok, location: @registration_course }
      else
        format.html { render :edit }
        format.json { render json: @registration_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registration_courses/1
  # DELETE /registration_courses/1.json
  def destroy
    authorize @registration_course
    @registration_course.destroy
    respond_to do |format|
      format.html { redirect_to registration_courses_url, notice: 'Registration course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration_course
      @registration_course = RegistrationCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_course_params
      params.require(:registration_course).permit(:admission_date, :locked, :conclusion_date, :curso_id, :aluno_id)
    end
end
