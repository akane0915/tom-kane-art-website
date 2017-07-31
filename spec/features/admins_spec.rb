require 'rails_helper'

describe 'all things orders-related' do
  before :each do
    Admin.destroy_all
    @super_admin = FactoryGirl.create(:super_admin)
    visit new_admin_session_path
    fill_in "Email",  with: @super_admin.email
    fill_in "Password", with: @super_admin.password
    click_button "Log in"
  end

  it "allows super admins to create new admins" do
    visit new_admin_path
    @admin = FactoryGirl.build(:admin)
    fill_in "Email", with: @admin.email
    fill_in "Password", with: @admin.password
    fill_in "Password confirmation", with: @admin.password
    click_button "Create Admin"
    expect(page).to have_content 'Your admin has been saved.'
    expect(page).to have_content @admin.email
  end

  it "ensures fields are correctly filled out for new admins" do
    visit new_admin_path
    @admin = FactoryGirl.build(:admin)
    fill_in "Email", with: @admin.email
    fill_in "Password", with: @admin.password
    fill_in "Password confirmation", with: ''
    click_button "Create Admin"
    expect(page).to have_content 'Oops there were some errors'
  end

  it "allows superadmin to delete an admin" do
    @admin = FactoryGirl.create(:admin)
    visit admins_path
    click_on @admin.id
    expect(page).to have_content 'The admin has been deleted.'
  end

  # it "doesn't allow superadmin to delete itself" do
  #   #BUT IT DOES
  # end
end
