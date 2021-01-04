require "rails_helper"

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it {should have_many :movies}
    it {should have_many :movie_actors}
  end

  describe "age_sort" do
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

    it "should sort by age" do
      ordered = Actor.age_sort(Actor.all)

      expect(ordered).to eq([@hathaway, @pit, @andrews])
    end
  end

  describe "average_age" do
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

    it "return average age" do
      average = Actor.average_age(Actor.all)

      expect(average).to eq(60.0)
    end
  end
end