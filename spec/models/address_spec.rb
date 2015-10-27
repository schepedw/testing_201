require 'rails_helper'

describe Address do
  before do
    @address = Address.new
    @illinois = 'il'
    @chicago = 'chicago'
    @chi_zip = (60600..60700).to_a.sample.to_s #This is intentionally slow and awful. Let's pretend its necessary, to illustrate the downsides of `before`
    @rand_zip = (50600..50700).to_a.sample.to_s
    @utah  = 'ut'
    @salt_lake_city = 'salt_lake_city'
  end
  describe '#chicago_address?' do
    context 'chicago address given' do
      context "city is 'chicago'" do
        it 'returns true' do
          @address.state = @illinois
          @address.city = @chicago
          expect(@address.chicago_address?).to be true
        end
      end

      context 'zip is a chicago zip' do
        it 'returns true' do
          @address.state = @illinois
          @address.zip = @chi_zip
          expect(@address.chicago_address?).to be true
        end
      end
    end

    context 'non-chicago address given' do
      context 'state is not illinois' do
        before do
          @address.state = @utah
        end
        it 'returns false for `chicago`' do
          @address.city = @chicago #the well known Chicago, Utah
          expect(@address.chicago_address?).to be false
        end

        it 'returns false for chicago zip code' do
          @address.zip = @chi_zip
          expect(@address.chicago_address?).to be false
        end
      end

      context 'zip & city are incorrect' do
        before do
        end
        it 'returns false' do
          @address.state = @illinois
          @address.zip = @rand_zip
          @address.city = @salt_lake_city
          expect(@address.chicago_address?).to be false
        end
      end
    end
  end
end
