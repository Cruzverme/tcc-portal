require 'test_helper'

class CamerasControllerTest < ActionController::TestCase
  setup do
    @camera = cameras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cameras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create camera" do
    assert_difference('Camera.count') do
      post :create, camera: { curso_id: @camera.curso_id, disponivel: @camera.disponivel, horario_disponivel_final: @camera.horario_disponivel_final, horario_disponivel_inicial: @camera.horario_disponivel_inicial, ip_audio: @camera.ip_audio, ip_video: @camera.ip_video, sala: @camera.sala, user_id: @camera.user_id }
    end

    assert_redirected_to camera_path(assigns(:camera))
  end

  test "should show camera" do
    get :show, id: @camera
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @camera
    assert_response :success
  end

  test "should update camera" do
    patch :update, id: @camera, camera: { curso_id: @camera.curso_id, disponivel: @camera.disponivel, horario_disponivel_final: @camera.horario_disponivel_final, horario_disponivel_inicial: @camera.horario_disponivel_inicial, ip_audio: @camera.ip_audio, ip_video: @camera.ip_video, sala: @camera.sala, user_id: @camera.user_id }
    assert_redirected_to camera_path(assigns(:camera))
  end

  test "should destroy camera" do
    assert_difference('Camera.count', -1) do
      delete :destroy, id: @camera
    end

    assert_redirected_to cameras_path
  end
end
