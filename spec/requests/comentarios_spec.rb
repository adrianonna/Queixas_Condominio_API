require 'rails_helper'

RSpec.describe "Comentarios request API", type: :request do
  context "GET /comentarios" do

    # Mongo::Error::NoServerAvailable:
    #     No primary server is available in cluster: #<Cluster topology=Unknown[localhost:27017] servers=[#<Server address=localhost:27017 UNKNOWN>]> with timeout=30, LT=0.015
    before do
      FactoryBot.create( :comentario, descricao: 'blablabla', usuario_id: '5fb417be4debe728b0edb9a5', queixa_id: '5fbd75593ca5732d6c6370c5')
      FactoryBot.create( :comentario, descricao: 'blablabla', usuario_id: '5fb417be4debe728b0edb9a5', queixa_id: '5fbd75593ca5732d6c6370c5')
    end

    let(:username) { 'adriano@admin.com' }
    let(:password) { '123456' }

    it 'Get all comments' do
      get '/comentarios'
      expect(response).to have_http_status(:success) # retorna 302 Moved Temporarily
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'Get all comments' do
      get '/comentarios', as: :json, headers: {:Authorization => "UxQUfrH28eZrrkQ6zooH"}
      expect(response).to have_http_status(:success) # retorna 401 Unauthorized
    end

   it 'Get all comments' do
      get '/comentarios'
      expect(response).to have_http_status(:success) # retorna 302 Moved Temporarily
    end

    it 'Get all comments' do
      header 'Authorization', "Bearer UxQUfrH28eZrrkQ6zooH"
      get '/comentarios'
      expect(response).to have_http_status(:success) # retorna 302 Moved Temporarily
    end

    it "Get all comments" do
      authorize(username, password)
      get '/comentarios'
      expect(response).to have_http_status(:success) # retorna 302 Moved Temporarily
    end

    it "Get all comments" do
      digest_authorize(username, password)
      get '/comentarios'
      expect(response).to have_http_status(:success) # retorna 302 Moved Temporarily
    end

    it "Get all comments" do
      get '/comentarios', headers: { 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('adriano@admin.com', '123456') }
      expect(response).to have_http_status(:success) # retorna 302 Moved Temporarily
    end

    ## --- Essa forma parece ser a correta!! ---
    it 'return all comentarios' do
      headers = { "ACCEPT" => "application/json", "X-Usuario-Email" => "adriano@admin.com", "X-Usuario-Token" => "UxQUfrH28eZrrkQ6zooH"}
      get '/comentarios', :headers => headers
      expect(response).to have_http_status(:success)
    end
    # Mongo::Error::NoServerAvailable:
    #     No primary server is available in cluster: #<Cluster topology=Unknown[localhost:27017] servers=[#<Server address=localhost:27017 UNKNOWN>]> with timeout=30, LT=0.015

  end

  context "POST /comentarios" do
    let(:username) { 'adriano@admin.com' }
    let(:password) { '123456' }

    it "Create a new comment" do
      post '/comentarios', params: { comentario: { descricao: 'Descrição'} }
      expect(response).to have_http_status(:created) # retorna 302 Moved Temporarily
    end

    it "Create a new comment" do
      post '/comentarios', params: { comentario: {descricao: 'blablabla', usuario_id: '1', queixa_id: '1'} }, headers: { 'HTTP_ACCEPT' => "application/json", "Authorization" => "UxQUfrH28eZrrkQ6zooH" }
      expect(response).to have_http_status(:created) # retorna 401 unauthorized
    end

    it "Create a new comment" do
      authorize(username, password)
      post '/comentarios', params: { comentario: {descricao: 'blablabla', usuario_id: '1', queixa_id: '1'} }
      expect(response).to have_http_status(:created) # retorna 302 Moved Temporarily
    end

    it "Create a new comment" do
      digest_authorize(username, password)
      post '/comentarios', params: { comentario: {descricao: 'blablabla', usuario_id: '1', queixa_id: '1'} }
      expect(response).to have_http_status(:created) # retorna 302 Moved Temporarily
    end

    it "Create a new comment" do
      post '/comentarios', params: { comentario: {descricao: 'blablabla', usuario_id: '1', queixa_id: '1'} }, headers: { 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('adriano@admin.com', '123456') }
      expect(response).to have_http_status(:created) # retorna 302 Moved Temporarily
    end

    it "Create a new comment" do
      post '/perfils', params: { perfil: {tipo: 'blablabla'} }, headers: { 'HTTP_ACCEPT' => "application/json", "X-Usuario-Email" => "adriano@admin.com", "X-Usuario-Token" => "UxQUfrH28eZrrkQ6zooH" }
      expect(response).to have_http_status(:created)
    end
    # Mongo::Error::NoServerAvailable:
    #     No primary server is available in cluster: #<Cluster topology=Unknown[localhost:27017] servers=[#<Server address=localhost:27017 UNKNOWN>]> with timeout=30, LT=0.015

    it 'return all comentarios' do
      headers = { "ACCEPT" => "application/json", "X-Usuario-Email" => "adriano@admin.com", "X-Usuario-Token" => "UxQUfrH28eZrrkQ6zooH"}
      post '/comentarios', :params => { :comentario => {:descricao => "minha descrição"}}, :headers => headers
      expect(response).to have_http_status(:success)
    end
    # Mongo::Error::NoServerAvailable:
    #     No primary server is available in cluster: #<Cluster topology=Unknown[localhost:27017] servers=[#<Server address=localhost:27017 UNKNOWN>]> with timeout=30, LT=0.015

  end

  context "PUT /comentarios/id" do

  end

  context "PACTH /comentarios/id" do

  end

  context "DELETE /comentarios/:id" do
    let!(:comentario) { Comentario.new(descricao: 'Descrição').save }

    it "Delete a comment" do
      expect {
        delete "/comentarios/#{comentario.id}"
      }.to change { Comentario.count }.from(1).to(0)
      expect(response).to have_http_status(:success)
    end

  end

end
