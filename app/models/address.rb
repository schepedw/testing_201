# id         | integer                     | not null default nextval('addresses_id_seq'::regclass)
# house      | character varying           |
# street     | character varying           |
# city       | character varying           |
# state      | character varying           |
# zip        | character varying           |
# created_at | timestamp without time zone | not null
# updated_at | timestamp without time zone | not null

class Address < ActiveRecord::Base
  has_and_belongs_to_many :users

  def as_json(_opts = {})
    {
      id: id,
      house: house,
      street: street,
      city: city,
      state: state,
      zip:  zip
    }
  end

  def chicago_address?
    (city == 'chicago' || (60600..60700).include?(zip.to_i)) &&
      state == 'il'
  end
end
