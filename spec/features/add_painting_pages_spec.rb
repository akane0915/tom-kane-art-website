require 'rails_helper'

describe "the paintings pages" do

  before :each do
    Admin.destroy_all
    admin = FactoryGirl.create(:admin)
    @painting = FactoryGirl.create(:painting)
    visit new_admin_session_path
    fill_in "Email",  with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
  end

  it "views main page with paintings" do
    visit paintings_path
    expect(page).to have_content 'Cherry Blossoms With Wind'
  end

  it "goes through creating painting process successfully" do
    visit new_painting_path
    fill_in "Title", with: 'Something Cool'
    fill_in "Year", with: '1999'
    fill_in "Description", with: 'I wandered lonely as a cloud'
    fill_in "Dimensions", with: '5 x 5'
    fill_in "Medium", with: 'Banana'
    fill_in "Support", with: 'Super'
    select "No", :from => "painting[framed]"
    select "Landscape", from: "painting[style]"
    select "available", from: "painting[status]"
    fill_in "Price", with: 555
    #add paperclip thingy here??
    click_button "Create Painting"
    expect(page).to have_content 'Painting was successfully created'
  end

  it "goes through creating painting process UNsuccessfully" do
    visit new_painting_path
    fill_in "Title", with: ''
    fill_in "Year", with: '1999'
    fill_in "Description", with: 'I wandered lonely as a cloud'
    fill_in "Dimensions", with: '5 x 5'
    fill_in "Medium", with: 'Banana'
    fill_in "Support", with: 'Super'
    select "No", :from => "painting[framed]"
    select "Landscape", from: "painting[style]"
    select "available", from: "painting[status]"
    fill_in "Price", with: 555
    click_button "Create Painting"
    expect(page).to have_content 'error prohibited this painting from being saved'
  end

  it "goes through the editing painting process" do
    visit edit_painting_path(@painting.id)
    fill_in "Description", with: 'I wandered lonely as a cloud!!!!'
    click_button "Update Painting"
    expect(page).to have_content 'Painting was successfully updated'
  end

  it "goes through the unsuccessful editing painting process" do
    visit edit_painting_path(@painting.id)
    fill_in "Title", with: ''
    click_button "Update Painting"
    expect(page).to have_content 'error prohibited this painting from being saved'
  end

  it "goes through the delete a painting process" do
    visit painting_path(@painting)
    click_link 'Delete'
    expect(page).to have_content 'Painting was successfully destroyed.'
  end
end
