# require 'rails_helper'
#
# RSpec.describe "Perfils request API", type: :request do
#   context "GET /perfils" do
#     before do
#       FactoryBot.create(:perfil, tipo: 'campo tipo factory')
#       FactoryBot.create(:perfil, tipo: 'campo tipo factory2')
#     end
#     let(:username) { 'adriano@admin.com' }
#     let(:password) { '123456' }
#
#     it "Return all perfils" do
#       get '/perfils'
#       expect(response).to have_http_status(:success)
#       expect(JSON.parse(response.body).size).to eq(2)
#     end
#   end
#
#   context "POST /perfils" do
#     it "Create a perfil" do
#       post '/perfils', params: { perfil: {tipo: 'blablabla'} }, headers: { 'HTTP_ACCEPT' => "application/json", "Authorization" => "UxQUfrH28eZrrkQ6zooH" }
#       expect(response).to have_http_status(:created) #expected the response to have status code :created (201) but it was :unauthorized (401)
#     end
#
#     it "Create a perfil" do
#       post '/perfils', params: { perfil: {tipo: 'blablabla'} }, headers: { 'HTTP_ACCEPT' => "application/json", "X-Usuario-Email" => "adriano@admin.com", "X-Usuario-Token" => "UxQUfrH28eZrrkQ6zooH" }
#       expect(response).to have_http_status(:created)
#     end
#   #   # Mongo::Error::NoServerAvailable:
#   #   #     No primary server is available in cluster: #<Cluster topology=Unknown[localhost:27017] servers=[#<Server address=localhost:27017 UNKNOWN>]> with timeout=30, LT=0.015
#
#   end
#
#   context "DELETE /perfils/:id" do
#     it "Delete a perfil" do
#       perfil = FactoryBot.create(:perfil, tipo: 'campo tipo factory')
#       delete "/perfils/#{perfil._id}"
#       expect(response).to have_http_status(:success)
#     end
#   end
#
# end
