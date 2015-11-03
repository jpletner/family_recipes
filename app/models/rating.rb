class Rating < ActiveRecord::Base
  belongs_to :recipe
  validates :rate, :presence => true

  def to_s
    rate
  end

end
