class Charge < ApplicationRecord
  belongs_to :order

  validates :name,
    :email,
    :phone,
    :address1,
    :city,
    :state,
    :zip,
    :country,
    presence: true
end