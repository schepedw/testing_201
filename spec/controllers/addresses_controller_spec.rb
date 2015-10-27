require 'rails_helper'

describe AddressesController do
  describe 'find' do
    context 'records exist to find' do
      before do
        address = Address.create
        get :show, id: address.id
      end
      it 'responds with 200' do
        expect(response.status).to eql 200
      end
    end
    context 'no records exist to find' do
      before do
        Address.delete_all
        get :show, id: 3
      end
      it 'responds with 404' do
        expect(response.status).to eql 404
      end
    end
  end
end
