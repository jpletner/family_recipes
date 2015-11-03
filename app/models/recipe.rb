class Recipe < ActiveRecord::Base
  has_many :tags, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :title, :presence => true
  validates :author, :presence => true
  validates :ingredients, :presence => true
  validates :instructions, :presence => true

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
    validates_attachment :image, :presence => true,
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
      size: { in: 0..10.megabytes }

  accepts_nested_attributes_for :tags,
                                reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true

  accepts_nested_attributes_for :ratings,
                                reject_if: proc { |attributes| attributes['rate'].blank? },
                                allow_destroy: true

  def to_s
      name
  end


end
