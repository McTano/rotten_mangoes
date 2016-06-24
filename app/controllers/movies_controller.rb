class MoviesController < ApplicationController
  
  def index
    @movies = Movie.all
    [:title, :director].each do |field|
    @movies = @movies.matches(field, "%#{params[field]}%".upcase) if params[field].present?
    end
    @movies = selected_runtime(@movies)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path notice: "{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image, :description
      )
  end

  def selected_runtime(movies)
      case params[:runtime_in_minutes]
      when "Under 90 minutes"
        movies.runtime_under(90)
      when "Between 90 and 120 minutes"
        movies.runtime_between(90, 120)
      when "Over 120 minutes"
        movies.runtime_over(120)
      else
        movies
      end
  end

end
