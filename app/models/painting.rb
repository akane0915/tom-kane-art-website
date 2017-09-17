class Painting < ApplicationRecord

  STATUS = {
    available: 2,
    unavailable: 3,
    sold: 1,
    hidden: 0,
  }

  STYLES = {
    landscape: 0,
    portrait: 1,
    square: 2,
  }

  FRAMED = {
    false: false,
    true: true,
  }

  has_many :order_items
  validates :dimensions, :medium, :support, :price, :style, :status, presence: true
  validates :title, presence: true, uniqueness: true

  enum status: STATUS

  has_attached_file :pclip_image,
      styles: {
        :medium => "640x640>",
        :masthead => ["1800x1800", :jpg],
        :gallery => ["900x900>", :jpg],
        :thumb => "100x100>" },
      url: ":s3_domain_url",
      path: 'paintings/:id/pclip_image/:style_:basename.:extension',
      storage: :s3,
      s3_protocol: 'https',
      s3_region: ENV["AWS_S3_REGION"],
      s3_credentials: {
        s3_host_name: ENV["AWS_S3_HOST_NAME"],
        bucket: ENV["AWS_S3_BUCKET"],
        access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
      }

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
