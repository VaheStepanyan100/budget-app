require 'rails_helper'

RSpec.feature 'purchases/show', type: :feature do
  include Devise::Test::IntegrationHelpers 

  let!(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password') }
  let(:category) { Category.create(name: 'Test Category', icon: 'backarrow.png', user: user) }
  let(:purchase) { Purchase.new(name: 'Test Purchase', amount: 100) }

  before(:each) do
    purchase.author = user
    purchase.categories << category
    purchase.save
    login_as(user, scope: :user)
    visit category_purchase_path(category, purchase)
  end

  scenario 'renders attributes in <p>' do
    expect(page).to have_content('Purchase')
  end

  scenario 'navigates back to category page' do
    click_on 'Back'
    expect(page).to have_current_path(category_path(category))
  end

  scenario 'allows signing out' do
    click_on 'Sign Out'
    expect(page).to have_content('Budget')
  end
end
