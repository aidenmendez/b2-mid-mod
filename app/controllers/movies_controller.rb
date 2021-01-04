class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @sorted_actors = Actor.age_sort(@movie.actors)
  end
end