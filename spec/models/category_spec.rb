require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password123') }
  let(:category) { Category.new(name: 'Example Category', icon: 'https://example.com/icon.png', user:) }

  it 'validity' do
    expect(category).to be_valid
  end

  it 'has a name' do
    category.name = ''
    expect(category).not_to be_valid
  end

  it 'has a user associated' do
    category.user = nil
    expect(category).not_to be_valid
  end

  it 'associated user is valid' do
    expect(category.user).to be_valid
  end
end
