require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password123') }

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'has a name' do
    user.name = ''
    expect(user).not_to be_valid
  end
end
