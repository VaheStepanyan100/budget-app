require 'rails_helper'

RSpec.describe Purchase, type: :model do
  let(:user) { User.create(email: 'user@example.com', password: 'password', name: 'John Doe') }
  let(:category) { Category.create(name: 'Category', icon: 'icon', user:) }
  let(:purchase) { Purchase.new(name: 'Purchase Name', amount: 100, author: user) }

  it 'is valid' do
    purchase.categories << category
    expect(purchase).to be_valid
  end

  it 'has a name' do
    purchase.name = ''
    expect(purchase).not_to be_valid
  end

  it 'has a valid amount' do
    purchase.amount = nil
    expect(purchase).not_to be_valid
  end

  it 'has an author associated' do
    purchase.author = nil
    expect(purchase).not_to be_valid
  end

  it 'associated author is valid' do
    expect(purchase.author).to be_valid
  end
end
