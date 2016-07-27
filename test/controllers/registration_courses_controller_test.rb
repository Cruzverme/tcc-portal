require 'test_helper'

class RegistrationCoursesControllerTest < ActionController::TestCase
  setup do
    @registration_course = registration_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registration_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registration_course" do
    assert_difference('RegistrationCourse.count') do
      post :create, registration_course: { admission_date: @registration_course.admission_date, aluno_id: @registration_course.aluno_id, conclusion_date: @registration_course.conclusion_date, curso_id: @registration_course.curso_id, locked: @registration_course.locked }
    end

    assert_redirected_to registration_course_path(assigns(:registration_course))
  end

  test "should show registration_course" do
    get :show, id: @registration_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration_course
    assert_response :success
  end

  test "should update registration_course" do
    patch :update, id: @registration_course, registration_course: { admission_date: @registration_course.admission_date, aluno_id: @registration_course.aluno_id, conclusion_date: @registration_course.conclusion_date, curso_id: @registration_course.curso_id, locked: @registration_course.locked }
    assert_redirected_to registration_course_path(assigns(:registration_course))
  end

  test "should destroy registration_course" do
    assert_difference('RegistrationCourse.count', -1) do
      delete :destroy, id: @registration_course
    end

    assert_redirected_to registration_courses_path
  end
end
