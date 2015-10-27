# id     | integer           | not null default nextval('account_types_id_seq'::regclass)
# name   | character varying | 

class AccountType < ActiveRecord::Base
end
