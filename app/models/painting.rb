class Painting < ApplicationRecord
  has_many :order_items
  validates :dimensions, :medium, :support, :price, :style, presence: true
  validates :title, presence: true, uniqueness: true
  has_many :order_items

  has_attached_file :pclip_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pclip_image, content_type: /\Aimage\/.*\z/

  before_create do
    self.slug = slug_it(self.title)
  end

  private
  def slug_it(title)
    return unless title
    downcase = title.downcase
    # [^a-z 0-9]+ means to remove anything that isnt alphanumeric or a space
    clean = downcase.gsub(/ - /, "_")
    extra_clean = clean.gsub(/[^a-z 0-9_]+/, "")
    slug = extra_clean.gsub(/\s/, "_")
  end
end
