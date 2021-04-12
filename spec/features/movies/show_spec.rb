require 'rails_helper'

RSpec.describe "Movies Show Page" do
  before {
    @mgm = Studio.create!(name: "MGM", location: "Hollywood")
    @top_gun = @mgm.movies.create!(title: "Top Gun", creation_year: 1985, genre: "action")
    @tom = @top_gun.actors.create!(name: "Tom Cruise", age: 22, currently_working: true)
    @lady = @top_gun.actors.create!(name: "Lady Blonde", age: 24, currently_working: true)
    @old = @top_gun.actors.create!(name: "Fred Old", age: 56, currently_working: false)
    @travolta = Actor.create!(name: "John Travolta", age: 34, currently_working: false)
  }
  context "When I visit a movies show page" do
    it "I see the title, creation_year, and genre" do
      visit movie_path(@top_gun)

      expect(page).to have_content(@top_gun.title)
      expect(page).to have_content(@top_gun.creation_year)
      expect(page).to have_content(@top_gun.genre)
    end

    it "And I see all fo the actors in the movie" do
      visit movie_path(@top_gun)

      expect(page).to have_content(@tom.name)
      expect(page).to have_content(@lady.name)
      expect(page).to have_content(@old.name)
    end

    it "I do not see any actors listed that are not part of the movie" do
      visit movie_path(@top_gun)

      expect(page).to_not have_content(@travolta.name)
    end

    it "And I see a form to add an actor to this movie" do
      visit movie_path(@top_gun)

      expect(page).to have_content("Add Actor to this Movie:")
      expect(page).to have_content("Name:")
      fill_in "Name:", with: "John Travolta"
      click_on "Search"
      expect(current_path).to eq(movie_path(@top_gun))
      expect(page).to have_content(@travolta.name)
    end
  end
end
