require 'rails_helper' 
describe User do
  before do
    @user = User.new(ssn: 2345, login: 'log_me_in')
  end
  describe '#from_chicago?' do
    context 'empty addresses' do
      it 'returns false' do
        expect(@user.from_chicago?).to be false
      end
    end
    context 'non-chicago addresses' do
      before do
        address = Address.new(state: 'ut', city: 'chicago')
        @user.addresses << address
      end
      it 'returns false' do
        expect(@user.from_chicago?).to be false
      end
    end
    context 'non-chicago addresses' do
      before do
        address = Address.new(state: 'il', city: 'chicago')
        @user.addresses << address
      end
      it 'returns true' do
        expect(@user.from_chicago?).to be true
      end
    end
  end
end
