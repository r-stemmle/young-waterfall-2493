require 'rails_helper'

RSpec.describe Actor, type: :model do
  before {
    @lady = Actor.create!(name: "Lady Blonde", age: 24, currently_working: true)
    @old = Actor.create!(name: "Fred Old", age: 56, currently_working: false)
  }
  describe "class methods" do
    describe "#active" do
      it "only shows actors currently_working" do
        expect(Actor.active).to eq([@lady])
      end
    end

    describe "#oldest_first" do
      it "orders actors by oldest first" do
        expect(Actor.oldest_first).to eq([@old, @lady])
      end
    end

    describe "#find_by_name" do
      it "finds an actor record searching by name" do
        expect(Actor.find_by_name(@old.name)).to eq(@old)
      end
    end

  end
end
