# id         | integer           | not null default nextval('users_id_seq'::regclass)
# first_name | character varying |
# last_name  | character varying |
# ssn        | integer           | not null
# login      | character varying | not null

class User < ActiveRecord::Base
  has_and_belongs_to_many :addresses #TODO: make this a has many to demonstrate factory girl ish?

  def as_json(_opts = {})
    {
      first_name: first_name,
      last_name: last_name,
      ssn: ssn,
      login: login,
      addresses: addresses.map(&:as_json)
    }
  end
end
