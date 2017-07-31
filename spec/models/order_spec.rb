require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_many :order_items }
  it { should have_one :charge }
  it { should validate_presence_of :status }
  it { should validate_presence_of :total_price }
  it { should validate_presence_of :order_number }
  it { should validate_presence_of :shipping }
  it { should validate_presence_of :subtotal }
  it { should validate_presence_of :tax }
end
