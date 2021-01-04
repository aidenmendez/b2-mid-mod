class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.age_sort(actors)
    actors.order(:age)
  end
end