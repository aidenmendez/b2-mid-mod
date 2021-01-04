require "rails_helper"

RSpec.describe "As a user" do
  describe "when I visit the studio index page" do
    before(:each) do
      @studio1 = Studio.create(name:"Universal Studios", location:"Orlando, FL")
      @studio2 = Studio.create(name: "Paramount Pictures", location:"Los Angeles, CA")
      @movie1 = Movie.create(title: "Jurassic World", creation_year: 2015, genre: "Action")
    end
    it "I see a list of all of the movie studios" do

    end
    it "and all movies under its respective studio" do

    end
  end
end