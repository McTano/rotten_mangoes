class Review < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :movie

  validates_presence_of :user, :movie, :text

  validates :rating_out_of_ten, inclusion: 1..10

end
