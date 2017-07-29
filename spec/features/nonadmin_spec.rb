require 'rails_helper'

describe "the nonadmin testing" do

  it "ensures non-admins can't create paintings" do
    visit new_painting_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

end
