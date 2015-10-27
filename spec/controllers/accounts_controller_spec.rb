require 'rails_helper'

describe AccountsController do
  describe 'find' do
    context 'records exist to find' do
      before do
        u = User.create(ssn: 1234, login: 'log_me_in')
        a = AccountType.create(name: 'the kind with lots of money')
        acct = Account.create(account_type_id: a.id, user_id: u.id)
        get :show, id: acct.id
      end
      it 'responds with 200' do
        expect(response.status).to eql 200
      end
    end
    context 'no records exist to find' do
      before do
        Account.delete_all
        get :show, id: 3
      end
      it 'responds with 404' do
        expect(response.status).to eql 404
      end
    end
  end
end
