class Movie < ActiveRecord::Base

  mount_uploader :poster_image, ImageUploader

  validates_processing_of :poster_image
  validate :poster_image_size_validation

  has_many :reviews

  validates_presence_of :title, :director, :release_date

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validate :release_date_is_in_the_past

  class << self
    def matches(keyword)
      where('(UPPER("title") LIKE :keyword) OR (UPPER("director") LIKE :keyword)', keyword: keyword)
    end

    def runtime_over(min)
      where("runtime_in_minutes >= ?", min)
    end

    def runtime_under(max)
      where("runtime_in_minutes <= ?", max)
    end
    
    def runtime_between(min, max)
      result = self
      result = result.runtime_over(min) if min.present?
      result = result.runtime_under(max) if max.present?
      result.all
    end
  end


  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size unless reviews.size == 0
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

  private
  def poster_image_size_validation
    errors[:poster_image] << "should be less than 500KB" if poster_image.size > 0.5.megabytes
  end

end
