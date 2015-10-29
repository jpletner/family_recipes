class Rating < ActiveRecord::Base
  belongs_to :recipe

  validates :rate, :presence => true

end
