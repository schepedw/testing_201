require 'faker'

ActiveRecord::Base.transaction do
  User.delete_all
  Account.delete_all
  Bank.delete_all
  AccountType.delete_all
  Address.delete_all
  %w(saving checking money_market).each do |account|
    AccountType.create!(:name => account)
  end

  10.times do
    Address.create({
      house: Faker::Address.building_number,
      street: Faker::Address.street_name,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip: Faker::Address.zip
    })
  end

  10.times do
    address_id = (Address.first.id .. Address.last.id).to_a.sample
    unique_ssn = Faker::Number.number(9).to_i
    while (User.where(:ssn => unique_ssn).present?)
      unique_ssn += 1
    end
    User.create!(
      :first_name => Faker::Name.first_name,
      :last_name => Faker::Name.last_name,
      :login => Faker::Internet.user_name,
      :ssn => Faker::Number.number(9).to_i,
      :address_id => address_id
    )
  end

  10.times do
    address_id = (Address.first.id .. Address.last.id).to_a.sample
    Bank.create!(
      :address_id => address_id,
    )
  end

  10.times do
    account_type_id = (AccountType.first.id .. AccountType.last.id).to_a.sample
    user_id = (User.first.id .. User.last.id).to_a.sample
    bank_id = (Bank.first.id .. Bank.last.id).to_a.sample
    Account.create!(
      bank_id: bank_id,
      account_type_id: account_type_id,
      user_id: user_id
    )
  end

end
