require "rails_helper"

RSpec.describe "As a user" do
  describe "when I visit the studio index page" do
    before(:each) do
      @studio1 = Studio.create(name:"Universal Studios", location:"Orlando, FL")
      @studio2 = Studio.create(name: "Paramount Pictures", location:"Los Angeles, CA")
      @world = Movie.create(title: "Jurassic World", creation_year: 2015, genre: "Action", studio_id: @studio1.id)
      @shrek = Movie.create(title: "Shrek", creation_year: 2001, genre: "Comedy", studio_id: @studio1.id)
      @interstellar = Movie.create(title: "Interstellar", creation_year: 2014, genre: "Science fiction", studio_id: @studio2.id)
    end
    it "I see a list of all of the movie studios" do
      visit "/studios"
      expect(page).to have_content(@studio1.name)
      expect(page).to have_content(@studio2.name)
    end
    it "and all movies under its respective studio" do
      visit "/studios"
      within("#studio-section-#{@studio1.id}") do
        expect(page).to have_content(@world.name)
        expect(page).to have_content(@shrek.name)        
      end
      within("#studio-section-#{@studio2.id}") do
        expect(page).to have_content(@interstellar.name)
      end
    end
  end
end