require 'rails_helper'

RSpec.describe '/purchases', type: :request do
  include Devise::Test::IntegrationHelpers # Include Devise test helpers

  let(:user) { User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password') }
  let(:category) { Category.create(name: 'Some Category', icon: 'backarrow.png', user:) }
  let(:purchase) { Purchase.create(name: 'Some Purchase', amount: 100, author: user, categories: [category]) }

  before(:each) do
    sign_in user
  end

  describe 'GET /index' do
    it 'returns a successful response' do
      get category_path(category)
      expect(response).to have_http_status(200)
    end

    it 'correct template is rendered' do
      get category_path(category)
      expect(response).to render_template(:show)
    end

    it 'the response body includes correct placeholder text' do
      get category_path(category)
      expect(response.body).to include('New purchase')
    end
  end
end
