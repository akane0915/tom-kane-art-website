class Account < ApplicationRecord
  has_many :orders
  belongs_to :admin
end
