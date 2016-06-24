class Api::MoviesController < ApplicationController
  respond_to :json
  def index
    @movies = Movie.all
    render 'api/movies/index.json.rabl'
  end

end