require "rails_helper"

RSpec.describe SessionsController, type: :routing do
  describe "routing" do
    it "routes to #sign in" do
      expect(post: "/sign_in").to route_to("sessions#create")
    end
  end
end