require 'rails_helper'

RSpec.describe "Studio Show Page" do
  before {
    @mgm = Studio.create!(name: "MGM", location: "Hollywood")
  }

  context "When I visit a studio show page" do
    it "I see the studios name and location" do
      visit studio_path(@mgm)

      expect(page).to have_content(@mgm.name)
      expect(page).to have_content(@mgm.location)
    end
  end
end
