require "rails_helper"

RSpec.describe QueixasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/queixas").to route_to("queixas#index")
    end

    it "routes to #show" do
      expect(get: "/queixas/1").to route_to("queixas#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/queixas").to route_to("queixas#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/queixas/1").to route_to("queixas#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/queixas/1").to route_to("queixas#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/queixas/1").to route_to("queixas#destroy", id: "1")
    end

    it "routes to #find_by_criado_por" do
      expect(get: "queixas/find_by_criado_por/:criado_por").to route_to("queixas#find_by_criado_por", criado_por: ":criado_por")
    end

    it "routes to #find_by_criado_por_status_id" do
      expect(get: "queixas/find_by_criado_por_status_id/:criado_por/:status_id").to route_to("queixas#find_by_criado_por_status_id", criado_por: ":criado_por", status_id: ":status_id")
    end

    it "routes to #find_by_status_id" do
      expect(get: "queixas/find_by_status_id/:status_id").to route_to("queixas#find_by_status_id", status_id: ":status_id")
    end

    it "routes to #find_by_privacidade" do
      expect(get: "queixas/find_by_privacidade/:privacidade").to route_to("queixas#find_by_privacidade", privacidade: ":privacidade")
    end

    it "routes to #find_by_tipo" do
      expect(get: "queixas/find_by_tipo/:tipo").to route_to("queixas#find_by_tipo", tipo: ":tipo")
    end
  end
end
