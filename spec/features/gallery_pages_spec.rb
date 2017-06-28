require 'rails_helper'

describe "navigate to individual paintings page" do
  it "navigates to painting details page" do
    test_painting = Painting.create(
      title: 'Cherry Blossoms With Wind',
      description: 'Frame Optional',
      year: '2017',
      dimensions: '11 x 14 inches',
      medium: 'Acrylic',
      support: 'Canvas',
      framed: false,
      price: '1500',
      image: 'https://images-na.ssl-images-amazon.com/images/I/31Dy9-24ulL._SY355_.jpg',
      style: 'landscape'
      )
    visit home_path
    click_link("#{test_painting.title}")
    expect(page).to have_content "#{test_painting.title}"
  end

  it "navigates to the Privacy Policy" do
    visit home_path
    click_link("Privacy Policy")
    expect(page).to have_content "Privacy Policy"
  end

  it "navigates to the Copyright page" do
    visit home_path
    click_link("© 2017")
    expect(page).to have_content "COPYRIGHT"
  end

  it "opens navbar menu" do
    visit home_path
    find('#toggle').click
    expect(page).to have_content "About"
  end

  it "navigates to the about page" do
    visit home_path
    find('#toggle').click
    click_link("About")
    expect(page).to have_content "About"
  end

  it "navigates to the contact page" do
    visit home_path
    find('#toggle').click
    click_link("Contact")
    expect(page).to have_content "Contact Tom"
  end

  it "navigates back to the gallery page" do
    visit home_path
    find('#toggle').click
    click_link("Gallery")
    expect(page).to have_content "Tom Kane"
  end
end
