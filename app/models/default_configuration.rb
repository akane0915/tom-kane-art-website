class DefaultConfiguration < ApplicationRecord
  validates_numericality_of :shipping_fee,
    greater_than_or_equal_to: 0,
    allow_nil: true
end
