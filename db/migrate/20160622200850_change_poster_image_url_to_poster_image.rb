class ChangePosterImageUrlToPosterImage < ActiveRecord::Migration
  def change
    rename_column :movies, :poster_image_url, :poster_image
  end
end
