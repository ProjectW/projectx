class Company < ActiveRecord::Base
  has_many :company_accounts
  has_many :reviews
end
