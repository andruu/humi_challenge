require 'rails_helper'

RSpec.describe "Employees", type: :request do
  let!(:employees) { create_list(:employee, 10) }

  describe "GET /employees" do
    before { get employees_path }

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end

    it 'returns employees' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end

  describe 'GET /employees/:id' do
    context 'when the record exists' do
      before { get employee_path(1) }

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end

      it 'returns the employee' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(1)
      end
    end

    context 'when the record does not exist' do
      before { get employee_path(100) }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn&#39;t find Employee")
      end
    end
  end

  describe 'POST /employees' do
    let(:valid_attributes) { {
      first_name: 'Andrew',
      last_name: 'Weir',
      dob: 'april 5 1985',
      marital_status: 'single',
      sin: '123456789',
      hire_date: Date.current - 10
    } }

    context 'when the request is valid' do
      before { post '/employees', params: { employee: valid_attributes } }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'creates an employee' do
        expect(json['first_name']).to eq('Andrew')
      end
    end

    context 'when the request is invalid' do
      before { post '/employees', params: { employee: { first_name: 'Andrew' } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'should display validation errors' do
        expect(response.body).to include('"last_name":["can\'t be blank"]')
      end
    end
  end
end
