require 'rails_helper'

describe AccountTypesController do
  describe 'find' do
    context 'records exist to find' do
      before do
        a = AccountType.create(name: 'the kind with lots of money')
        get :show, id: a.id
      end
      it 'responds with 200' do
        expect(response.status).to eql 200
      end
    end
    context 'no records exist to find' do
      before do
        AccountType.delete_all
        get :show, id: 3
      end
      it 'responds with 404' do
        expect(response.status).to eql 404
      end
    end
  end
end
