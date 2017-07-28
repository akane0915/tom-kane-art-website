require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_one :charge }

end
