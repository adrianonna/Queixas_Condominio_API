require 'rails_helper'

RSpec.describe Usuario, type: :model do

  context 'Valores de Usuario' do

    it 'Usuário não válido' do
      usuario = Usuario.new
      expect(usuario.valid?).to be_falsey
    end

    it 'Criação de um Usuario' do
      usuario = Usuario.new
      usuario.id = '15165sdas'
      usuario.nome = 'Nome do usuário'
      usuario.email = 'teste@teste.com'
      usuario.endereco = 'Endereço do usuário'
      usuario.password = '123456'
      # usuario.password_confirmation = '123456'
      usuario.perfil_id = Perfil.new
      # usuario.queixa_ids = []
      # usuario.encrypted_password = 'teste'
      # usuario.reset_password_token = 'teste'
      # usuario.reset_password_sent_at = Time.new
      # usuario.remember_created_at = Time.new
      # usuario.authentication_token = 'teste'
      expect(usuario.valid?).to be_truthy
    end

  end

end
