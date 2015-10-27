require 'rails_helper'

describe User do
  describe '#as_json' do
    before do
      u = User.create(ssn: 2345, login: 'log_me_in')
      u.addresses << Address.create
      u.save!
    end

    it 'looks like json' do
      binding.pry
    end
  end
end
