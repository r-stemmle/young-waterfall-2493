class MoviesController < ApplicationController
  def show
    if params[:query]
      @actor = Actor.find_by_name(params[:query])
      @movie = Movie.find(params[:id])
    else
      @movie = Movie.find(params[:id])
    end
  end
end
