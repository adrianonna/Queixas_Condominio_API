require 'rails_helper'

RSpec.describe Perfil, type: :model do

  context 'Valores de Perfil' do

    it 'Perfil não válido' do
      perfil = Perfil.new
      expect(perfil.valid?).to be_falsey
    end

    it 'Criação de um Perfil' do
      perfil = Perfil.new
      perfil.tipo = 'Tipo'
      expect(perfil.valid?).to be_truthy
    end

  end

end
