require "rails_helper"

RSpec.describe ComentariosController, type: :routing do
  describe "routing" do
    it "routes to #index (Get all)" do
      expect(get: "/comentarios").to route_to("comentarios#index")
    end

    it "routes to #show (Get one)" do
      expect(get: "/comentarios/1").to route_to("comentarios#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/comentarios").to route_to("comentarios#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/comentarios/1").to route_to("comentarios#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/comentarios/1").to route_to("comentarios#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/comentarios/1").to route_to("comentarios#destroy", id: "1")
    end

    it "routes to #find_by_queixa_id" do
      expect(get: "comentarios/find_by_queixa_id/1").to route_to("comentarios#find_by_queixa_id", queixa_id: "1")
    end

  end
end
