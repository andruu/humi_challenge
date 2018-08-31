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
end
