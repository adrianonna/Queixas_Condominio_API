require 'rails_helper'

RSpec.describe Usuario, type: :model do

  context 'Valores de Usuario' do

    it 'Usuário não válido' do
      usuario = Usuario.new
      expect(usuario.valid?).to be_falsey
    end

    # it 'Criação de um Usuario' do
    #   usuario = Usuario.new
    #   usuario.nome = 'Nome do usuário'
    #   usuario.email = 'teste@teste.com'
    #   usuario.endereco = 'Endereço do usuário'
    #   usuario.password = '123456'
    #   usuario.password_confirmation = '123456'
    #   usuario.perfil_id = '5fa1b6b64debe72ed41388ac'
    #   expect(usuario.valid?).to be_truthy
    # end

  end

end
