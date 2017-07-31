require 'rails_helper'

describe Painting do
  it { should validate_presence_of :title }
  it { should validate_presence_of :dimensions }
  it { should validate_presence_of :medium }
  it { should validate_presence_of :support }
  # it { should validate_presence_of :framed }
  it { should validate_presence_of :price }
  # it { should validate_presence_of :year }
  it { should validate_presence_of :style }
  it { should validate_uniqueness_of :title }
  it { should validate_presence_of :status }

  # it { should have_attached_file(:pclip_image_file_name) }
  # it { should validate_attachment_presence(:pclip_image_file_name) }


  describe "#slug_it" do
    let(:painting1) {
      Painting.create(
        title: "BobKnob",
        dimensions: "10 x 20",
        medium: "acrylic",
        support: "wood",
        price: 666.66,
        style: "square",
        status: "for sale",
      )
    }
    let(:painting2) {
      Painting.create(
        title: "Puppies - Kittens",
        dimensions: "12 x 25",
        medium: "cat hair",
        support: "canvas",
        price: 5500,
        style: "portrait",
        status: "for sale",
      )
    }
    let(:painting3) {
      Painting.create(
        title: "Life... Death... Blood!",
        dimensions: "12 x 25",
        medium: "cat hair",
        support: "canvas",
        price: 5500,
        style: "portrait",
        status: "for sale",
      )
    }
    let(:painting4) {
      Painting.create(
        title: "Sex and Drugs - and Rock'n'Roll!",
        dimensions: "12 x 25",
        medium: "cat hair",
        support: "canvas",
        price: 5500,
        style: "portrait",
        status: "for sale",
      )
    }

    describe "creates slug from title" do
      it "downcases the title" do
        expect(painting1.slug).to eq("bobknob")
      end

      it "replaces ' - ' with an '_'" do
        expect(painting2.slug).to eq("puppies_kittens")
      end

      it "removes any other nonalphanumeric char, _, and ' '" do
        expect(painting3.slug).to eq("life_death_blood")
      end

      it "removes spaces and replaces with underscore" do
        expect(painting4.slug).to eq("sex_and_drugs_and_rocknroll")
      end
    end

  end
end
