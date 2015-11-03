class Recipe < ActiveRecord::Base
  has_many :tags, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :title, :presence => true
  validates :author, :presence => true
  validates :ingredients, :presence => true
  validates :instructions, :presence => true

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
