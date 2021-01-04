class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.age_sort(actors)
    actors.order(:age)
  end

  def self.average_age(actors)
    actors.average(:age)
  end

  def self.name_search(search_term)
    Actor.where(name: search_term).first
  end
end