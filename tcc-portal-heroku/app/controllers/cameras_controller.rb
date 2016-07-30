class CamerasController < ApplicationController
  before_action :set_camera, only: [:show, :edit, :update, :destroy, :record, :record_start, :record_stop]

  @@controls = Hash.new

  # GET /cameras
  # GET /cameras.json
  def index
    @cameras = Camera.all
  end

  # GET /cameras/1
  # GET /cameras/1.json
  def show
  end

  # GET /cameras/new
  def new
    @camera = Camera.new
  end

  # GET /cameras/1/edit
  def edit
  end

  # POST /cameras
  # POST /cameras.json
  def create
    @camera = Camera.new(camera_params)
    @camera.user_id = current_user.id

    respond_to do |format|
      if @camera.save
        format.html { redirect_to @camera, notice: 'Camera was successfully created.' }
        format.json { render :show, status: :created, location: @camera }
      else
        format.html { render :new }
        format.json { render json: @camera.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cameras/1
  # PATCH/PUT /cameras/1.json
  def update
    respond_to do |format|
      if @camera.update(camera_params)
        format.html { redirect_to @camera, notice: 'Camera was successfully updated.' }
        format.json { render :show, status: :ok, location: @camera }
      else
        format.html { render :edit }
        format.json { render json: @camera.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cameras/1
  # DELETE /cameras/1.json
  def destroy
    @camera.destroy
    respond_to do |format|
      format.html { redirect_to cameras_url, notice: 'Camera was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def record 
    

    @camera.disponivel = false

    respond_to do |format|
      if @camera.save
        format.html { render :record, notice: 'Camera está pronta para uso.' }
        format.json { render :record, status: :ok, location: @camera }
      else
        format.html { render :record }
        format.json { render json: @camera.errors, status: :unprocessable_entity }
      end
    end
  end


  require 'streamio-ffmpeg'
 
  def record_start
    url_video = @camera.ip_video #"http://192.168.0.101:8080/video"
    url_audio = @camera.ip_audio #"http://192.168.0.101:8080/audio.wav"

    # tmp directory
    path = Rails.root.join('tmp')
    # create sub-directory as md5 hash based on URL
    sub_dir = Digest::MD5.hexdigest(url_video)
    # append sub_dir on the path
    destination_path = path.join(sub_dir) 
    timeout_in_seconds = 1

    puts params.to_json
    if !@@controls.key?(:users)
      @@controls[:users] = {}
    end 
    

    if !@@controls[:users].key?(current_user.id.to_s)
      @@controls[:users][current_user.id.to_s] = {}
    end

    if !@@controls[:users][current_user.id.to_s].key?(:camera)
      @@controls[:users][current_user.id.to_s][:camera] = {audio: [], video: []}
    end

    puts params.to_json

    #threads = []
    #threads = Thread.new { puts "Whats the big deal" }
    
    #puts @@controls[:users][current_user.id.to_s][:camera].to_json
    #@@controls[:users][current_user.id.to_s][:camera][:audio] << threads
    #puts @@controls[:users][current_user.id.to_s][:camera][:audio]

    @@controls[:users][current_user.id.to_s][:camera][:audio] = Thread.new do
      system("timeout -s KILL 30 wget --limit-rate=200000000k -P #{destination_path} #{url_audio} ")
    end

    @@controls[:users][current_user.id.to_s][:camera][:audio].run

    @@controls[:users][current_user.id.to_s][:camera][:video] = Thread.new do 
      system("timeout -s KILL 30 wget --limit-rate=200000000k -P #{destination_path} #{url_video} ")
    end

    puts "\nDone Video Download"

    respond_to do |format|      
      format.json { render json: {status: :gravando}, status: :ok }      
    end
  end

  def record_stop
    puts "ski"
    a = @@controls[:users][current_user.id.to_s][:camera][:audio]
    b = @@controls[:users][current_user.id.to_s][:camera][:video]
    a.run
    puts a
    puts a.status
    puts b
    puts b.status
    puts Thread.current 
    puts Thread.current.status
    #Thread.kill(a)
    #a.exit

    respond_to do |format|      
      format.json { render json: {status: :parou}, status: :ok }      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camera
      @camera = Camera.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camera_params
      params.require(:camera).permit(:ip_video, :ip_audio, :disponivel, :sala, :horario_disponivel_inicial, :horario_disponivel_final, :curso_id, :user_id)
    end
end
