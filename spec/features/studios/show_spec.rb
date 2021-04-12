require 'rails_helper'

RSpec.describe "Studio Show Page" do
  before {
    @mgm = Studio.create!(name: "MGM", location: "Hollywood")
    @top_gun = @mgm.movies.create!(title: "Top Gun", creation_year: 1985, genre: "action")
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
  end
end
