class AddStudioIdMovies < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies, :studio, index: true
  end
end
