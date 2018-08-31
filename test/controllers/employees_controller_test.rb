require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get employees_url, as: :json
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post employees_url, params: { employee: { dob: @employee.dob, encrypted_sin: @employee.encrypted_sin, first_name: @employee.first_name, hire_date: @employee.hire_date, last_name: @employee.last_name, marital_status: @employee.marital_status, preferences: @employee.preferences } }, as: :json
    end

    assert_response 201
  end

  test "should show employee" do
    get employee_url(@employee), as: :json
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@employee), params: { employee: { dob: @employee.dob, encrypted_sin: @employee.encrypted_sin, first_name: @employee.first_name, hire_date: @employee.hire_date, last_name: @employee.last_name, marital_status: @employee.marital_status, preferences: @employee.preferences } }, as: :json
    assert_response 200
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete employee_url(@employee), as: :json
    end

    assert_response 204
  end
end
