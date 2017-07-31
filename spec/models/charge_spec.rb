require 'rails_helper'

RSpec.describe Charge, type: :model do
  it { should belong_to :order }
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :phone }
  it { should validate_presence_of :address1 }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :zip }
  it { should validate_presence_of :country }

  # describe "#calculate_total" do
  #
  # end
end
