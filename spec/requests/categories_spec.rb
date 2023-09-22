require 'rails_helper'

RSpec.describe 'CategoriesController', type: :request do
  include Devise::Test::IntegrationHelpers # Include Devise test helpers

  describe 'GET /index' do
    before(:all) do
      @user = User.create(email: 'test@example.com', password: 'password')
      @category = Category.create(name: 'Test Category', user: @user)
    end

    before(:each) do
      sign_in @category.user
    end

    it 'returns a successful response' do
      get categories_path
      expect(response).to have_http_status(200)
    end

    it 'correct template is rendered' do
      get categories_path
      expect(response).to render_template(:index)
    end

    it 'the response body includes correct placeholder text' do
      get categories_path
      expect(response.body).to include('Categories')
    end
  end
end
