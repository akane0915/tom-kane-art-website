class Charge < ApplicationRecord
  EMAIL = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

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

  validates :email,
    presence: true,
    format: {
      with: EMAIL,
      message: "invalid"
    }

end
