class CursosController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /cursos
  # GET /cursos.json
  def index
    @cursos = Curso.all
  end

  # GET /cursos/1
  # GET /cursos/1.json
  def show
  end

  # GET /cursos/new
  def new
    @curso = Curso.new
    authorize @curso
  end

  # GET /cursos/1/edit
  def edit
    authorize @curso
  end

  # POST /cursos
  # POST /cursos.json
  def create
    @curso = Curso.new(curso_params)
    authorize @curso

    respond_to do |format|
      if coordenador? and @curso.save
        format.html { redirect_to @curso, notice: 'Curso was successfully created.' }
        format.json { render :show, status: :created, location: @curso }
      else
        format.html { render :new }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cursos/1
  # PATCH/PUT /cursos/1.json
  def update
    authorize @curso
    respond_to do |format|
      if coordenador? and @curso.update(curso_params)
        format.html { redirect_to @curso, notice: 'Curso was successfully updated.' }
        format.json { render :show, status: :ok, location: @curso }
      else
        format.html { render :edit }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    authorize @curso
    @curso.destroy
    respond_to do |format|
      format.html { redirect_to cursos_url, notice: 'Curso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def coordenador?
      if User.exists?(curso_params[:coordenador_id])
        coordenador = User.find(curso_params[:coordenador_id])
        if coordenador.role == 'coordenador'
          @curso.errors.delete(:coordenador)
          true
        else
          @curso.errors.add(:coordenador, "apenas.")
          false
        end
      else
        @curso.errors.add(:coordenador, "não existe.")
        false
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_curso
      @curso = Curso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_params
      params.require(:curso).permit(:nome, :descricao, :coordenador_id, :disciplines)
    end
end
