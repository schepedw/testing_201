# id         | integer           | not null default nextval('users_id_seq'::regclass)
# first_name | character varying |
# last_name  | character varying |
# ssn        | integer           | not null
# login      | character varying | not null

class User < ActiveRecord::Base
  has_and_belongs_to_many :addresses

  def as_json(_opts = {})
    {
      first_name: first_name,
      last_name: last_name,
      ssn: ssn,
      login: login,
      addresses: addresses.map(&:as_json)
    }
  end

  def from_chicago?
    addresses.any?(&:chicago_address?)
  end

  def address_cities
    addresses.map(&:city)
  end
end
