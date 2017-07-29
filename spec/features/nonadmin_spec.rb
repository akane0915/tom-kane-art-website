require 'rails_helper'

describe "the nonadmin testing" do
  before :each do
    @painting = FactoryGirl.create(:painting)
  end

  it "ensures non-admins can't create paintings" do
    visit new_painting_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  it "ensures non-admins can't edit paintings" do
    visit edit_painting_path(@painting)
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  it "ensures non-admins can't delete paintings" do
    visit painting_path(@painting)
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

end
