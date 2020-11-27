require "rails_helper"

RSpec.describe UsuariosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/usuarios").to route_to("usuarios#index")
    end

    it "routes to #show" do
      expect(get: "/usuarios/1").to route_to("usuarios#show", id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/usuarios/1").to route_to("usuarios#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/usuarios/1").to route_to("usuarios#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/usuarios/1").to route_to("usuarios#destroy", id: "1")
    end
  end
end
