require 'rails_helper'

RSpec.describe Queixa, type: :model do

  context 'Valores de Queixa' do

    it 'Queixa não válido' do
      queixa = Queixa.new
      expect(queixa.valid?).to be_falsey
    end

    it 'Criação de uma Queixa' do
      queixa = Queixa.new
      queixa.tipo = 'Tipo da queixa'
      queixa.gravidade = 'Leve'
      queixa.titulo = 'Titulo da queixa'
      queixa.descricao = 'Descrição da queixa'
      queixa.privacidade = false
      queixa.criado_por = 'Alguém'
      expect(queixa.valid?).to be_truthy
    end

  end

end
