require 'rails_helper'

RSpec.describe PurchasesController, type: :routing do
  describe 'routing' do
    it 'routes to #edit' do
      expect(get: '/purchases/1/edit').to route_to('purchases#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/purchases').to route_to('purchases#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/purchases/1').to route_to('purchases#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/purchases/1').to route_to('purchases#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/purchases/1').to route_to('purchases#destroy', id: '1')
    end
  end
end
