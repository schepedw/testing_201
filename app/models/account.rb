# id              | integer                     | not null default nextval('accounts_id_seq'::regclass)
# balance         | double precision            | default 0.0
# account_type_id | integer                     | not null
# created_at      | timestamp without time zone | not null
# updated_at      | timestamp without time zone | not null
# user_id         | integer                     | not null
# bank_id         | integer                     |

class Account < ActiveRecord::Base
  belongs_to :bank
  belongs_to :user
  def as_json(options = {})
    {
      id: id,
      user_id: user_id,
      bank_id: bank_id,
      balance: balance
    }
  end
end
