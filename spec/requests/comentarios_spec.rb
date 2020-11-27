require 'rails_helper'

RSpec.describe "Comentarios", type: :request do


  # describe "GET /comentarios" do
  #   it "Get all comments" do
  #     get '/comentarios'
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "POST /comentarios" do
  #   it "Create a new comment" do
  #     post '/comentarios', params: { comentario: { descricao: 'Descrição'} }
  #     expect(response).to have_http_status(:created)
  #   end
  # end
  #
  # describe "DELETE /comentarios/:id" do
  #   let!(:comentario) { Comentario.new(descricao: 'Descrição').save }
  #   it "Delete a comment" do
  #     delete "/comentarios/#{comentario.id}"
  #     expect(response).to have_http_status(:success)
  #   end
  # end




  # it 'return all comentarios' do
  #   # request.headers["X-Usuario-Email"] = "adriano@admin.com"
  #   # request.headers["X-Usuario-Token"] = "UxQUfrH28eZrrkQ6zooH"
  #   # request.headers["ACCEPT"] = "application/json"
  #   # get "/comentarios"
  #   # headers = {"X-Usuario-Email" => "adriano@admin.com", "X-Usuario-Token" => "UxQUfrH28eZrrkQ6zooH"}
  #   headers = { "ACCEPT" => "application/json", "X-Usuario-Email" => "adriano@admin.com", "X-Usuario-Token" => "UxQUfrH28eZrrkQ6zooH"}
  #   post '/comentarios', :params => { :comentario => {:descricao => "minha descrição"}}, :headers => headers
  #   expect(response).to have_http_status(:success)
  # end




  # it 'return all comentarios' do
  #     request.headers["X-Usuario-Email"] = "adriano@admin.com"
  #     request.headers["X-Usuario-Token"] = "UxQUfrH28eZrrkQ6zooH"
  #     request.headers["ACCEPT"] = "application/json"
  #     post '/comentarios', :params => { :comentario => {:descricao => "minha descrição"}}
  #     expect(response).to have_http_status(:success) #undefined method `headers' for nil:NilClass
  # end
  #
  # it 'return all comentarios' do
  #     headers = { "ACCEPT" => "application/json", "X-Usuario-Email" => "adriano@admin.com", "X-Usuario-Token" => "UxQUfrH28eZrrkQ6zooH"}
  #     post '/comentarios', :params => { :comentario => {:descricao => "minha descrição"}}, :headers => headers
  #     expect(response).to have_http_status(:success) #can't modify frozen String: "adriano@admin.com"
  # end
  #
  # it 'return all comentarios' do
  #     headers = { "ACCEPT" => "application/json"}
  #     post '/comentarios', :params => { :comentario => {:descricao => "minha descrição"}}, :headers => headers
  #     expect(response).to have_http_status(:success) # retorna 401 Unauthorized
  # end
  #
  #   it 'get to return all comentarios' do
  #     get '/comentarios', as: :json, headers: {:Authorization => "UxQUfrH28eZrrkQ6zooH"}
  #     expect(response).to have_http_status(:success) # retorna 401 Unauthorized
  #   end
  #
  #  it 'get to return all comentarios' do
  #     get '/comentarios'
  #     expect(response).to have_http_status(:success) # retorna 302 Moved Temporarily
  #   end



  # it 'get to return all comentarios' do
  #   # @request.env['Authorization'] = "UxQUfrH28eZrrkQ6zooH"
  #   # request.env['Authorization'] = "UxQUfrH28eZrrkQ6zooH"
  #   header 'Authorization', "Bearer UxQUfrH28eZrrkQ6zooH"
  #   get comentarios_path
  #   expect(response).to have_http_status(:success)
  # end



end
