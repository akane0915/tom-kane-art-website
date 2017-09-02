class Painting < ApplicationRecord
  has_many :order_items
  validates :dimensions, :medium, :support, :price, :style, :status, presence: true
  validates :title, presence: true, uniqueness: true

  has_attached_file :pclip_image,
      styles: {
        :medium => "640x640>",
        :masthead => ["1800x1800", :jpg],
        :gallery => ["900x900>", :jpg],
        :thumb => "100x100>" },
      url: ":s3_domain_url",
      path: 'paintings/:id/pclip_image/:style_:basename.:extension',
      storage: :s3,
      s3_protocol: 'http',
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

  STATUS_ORDERED = ['Available', 'sold', 'Unavailable']

  # Returns a case statement for ordering by a particular set of strings
  # Note that the SQL is built by hand and therefore injection is possible,
  # however since we're declaring the priorities in a constant above it's
  # safe.

  def self.order_by_status
    ret = "CASE"
    STATUS_ORDERED.each_with_index do |p, i|
      ret << " WHEN status = '#{p}' THEN #{i}"
    end
    ret << " END"
  end

  scope :by_status, -> { {order: order_by_status} }

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
