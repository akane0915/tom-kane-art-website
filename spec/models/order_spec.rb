require 'rails_helper'

RSpec.describe Order, type: :model do
  # it { should validate_presence_of :order_number }
end


RSpec.describe OrderItem, type: :model do
  it { should belong_to :order }
  it { should belong_to :painting }
end
