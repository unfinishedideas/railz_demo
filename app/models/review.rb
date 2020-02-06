class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :content, presence: true
  validates :title, presence: true
  validates :heat_lvl, presence: true, :inclusion => {:in => 1..5, :message => "Value should be between 1 and 5"}
  validates :rating, presence: true, :inclusion => {:in => 1..5, :message => "Value should be between 1 and 5"}
  validates_numericality_of :rating
  validates_numericality_of :heat_lvl
end
