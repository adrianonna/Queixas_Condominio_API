require 'rails_helper'

RSpec.describe Queixa, type: :model do

  context 'Valores de Queixa' do

    it 'Queixa não válida' do
      queixa = Queixa.new
      expect(queixa.valid?).to be_falsey
    end

    it 'Criação de uma Queixa' do
      queixa = Queixa.new
      queixa.tipo = 'Tipo da queixa'
      queixa.gravidade = 'Leve'
      queixa.titulo = 'Titulo da queixa'
      queixa.descricao = 'Descrição da queixa'
      queixa.privacidade = true
      queixa.criado_por = Usuario.new
      queixa.status_id = Status.new
      expect(queixa.valid?).to be_truthy
    end

    it 'Privacidade default false' do
      queixa = Queixa.new( tipo: 'bla', gravidade: 'bla', titulo: 'bla', descricao: 'bla', criado_por: Usuario.new, status_id: Status.new)
      expect(queixa.privacidade).to be_falsey
    end

    it 'Obrigatoriedade para titulo, tipo e descrição' do
      queixa = Queixa.new( gravidade: 'bla', criado_por: Usuario.new, status_id: Status.new)
      expect(queixa.valid?).to be_falsey
    end

  end

end
