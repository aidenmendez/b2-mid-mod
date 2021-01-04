class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @sorted_actors = Actor.age_sort(@movie.actors)
    @average_age = Actor.average_age(@movie.actors)
  end
end