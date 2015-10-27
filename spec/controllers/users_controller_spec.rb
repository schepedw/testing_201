require 'rails_helper'

describe UsersController do
  describe 'find' do
    context 'records exist to find' do
      before do
        u = User.create(ssn: 2345, login: 'log_me_in')
        get :show, id: u.id
      end
      it 'responds with 200' do
        expect(response.status).to eql 200
      end
    end
    context 'no records exist to find' do
      before do
        User.delete_all
        get :show, id: 3
      end
      it 'responds with 404' do
        expect(response.status).to eql 404
      end
    end
  end
end

