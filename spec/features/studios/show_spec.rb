require 'rails_helper'

RSpec.describe "Studio Show Page" do
  before {
    @mgm = Studio.create!(name: "MGM", location: "Hollywood")
    @top_gun = @mgm.movies.create!(title: "Top Gun", creation_year: 1985, genre: "action")
    @tom = @top_gun.actors.create!(name: "Tom Cruise", age: 22, currently_working: true)
    @lady = @top_gun.actors.create!(name: "Lady Blonde", age: 24, currently_working: true)
    @old = @top_gun.actors.create!(name: "Fred Old", age: 56, currently_working: false)
  }

  context "When I visit a studio show page" do
    it "I see the studios name and location" do
      visit studio_path(@mgm)

      expect(page).to have_content(@mgm.name)
      expect(page).to have_content(@mgm.location)
    end

    it "And I see the titles of all its movies" do
      visit studio_path(@mgm)

      expect(page).to have_content("Top Gun")
    end

    it "And I see a list of actors that have acted in any of the studios movies" do
      visit studio_path(@mgm)

      within ".studio-actors" do
        expect(page).to have_content(@tom.name)
        expect(page).to have_content(@lady.name)
      end
    end

    it "And I see the list of actors is ordered from oldest actor to youngest" do
      visit studio_path(@mgm)

      within ".studio-actors" do
        expect(page).to have_content(@tom.name)
        expect(page).to have_content(@lady.name)
        expect(@lady.name).to appear_before(@tom.name)
      end
    end

    it "And I see that the list of actors includes actors that are currently_working" do
      visit studio_path(@mgm)

      within ".studio-actors" do
        expect(page).to have_content(@tom.name)
        expect(page).to have_content(@lady.name)
        expect(page).to_not have_content(@old.name)
      end
    end

  end
end
