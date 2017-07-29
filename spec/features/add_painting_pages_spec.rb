require 'rails_helper'

describe "the paintings pages" do

  it "views main page with paintings" do
    admin = FactoryGirl.create(:admin)
    painting = FactoryGirl.create(:painting)
    visit new_admin_session_path
    fill_in "Email",  with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
    visit paintings_path
    expect(page).to have_content 'Cherry Blossoms With Wind'
  end
end
