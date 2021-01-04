require "rails_helper"

RSpec.describe "As a user" do
  describe "When I visit a movie's show page" do
    before(:each) do
      @studio1 = Studio.create(name:"Universal Studios", location:"Orlando, FL")
      @shrek = Movie.create(title: "Shrek", creation_year: 2001, genre: "Comedy", studio_id: @studio1.id)
      @hathaway = Actor.create(name: "Anne Hathaway", age: 38)
      @pit = Actor.create(name: "Brad Pit", age: 57)
      @andrews = Actor.create(name: "Julie Andrews", age: 85)
      MovieActor.create(actor: @hathaway, movie: @shrek)
      MovieActor.create(actor: @pit, movie: @shrek)
      MovieActor.create(actor: @andrews, movie: @shrek)
    end
    it "I see the movie's title, creation year, and genre," do
      visit "/movies/#{@shrek.id}"
      expect(page).to have_content(@shrek.title)
      expect(page).to have_content(@shrek.creation_year)
      expect(page).to have_content(@shrek.genre)
    end
    it "and a list of all its actors from youngest to oldest" do
      visit "/movies/#{@shrek.id}"

      expect(@hathaway.name).to appear_before(@pit.name)
      expect(@pit.name).to appear_before(@andrews.name)
    end
    it "and I see the average age of all of the movie's actors" do
      visit "/movies/#{@shrek.id}"

      expect(page).to have_content("Average Age: 60.0 years old")
    end
    describe "I see a form for an actors name" do
      it "and I fill in the form and click submit, I'm redirected to the movie show page and see the actor's name listed" do
        visit "/movies/#{@shrek.id}"

        fill_in("Name", with: "Julie Andrews")
        click_on("Submit")

        expect(current_path).to eq("/movies/#{@shrek.id}")
        within("#actor-search-section") do
          expect(page).to have_content("Julie Andrews")
        end
      end

    end
  end
end