require 'rails_helper'

RSpec.describe Comentario, type: :model do

  context 'Valores de Comentário' do

    it 'Comentário não válido' do
      comentario = Comentario.new
      expect(comentario.valid?).to be_falsey
    end

    it 'Criação de um Comentario' do
      comentario = Comentario.new
      comentario.descricao = 'Descrição'
      comentario.usuario_id = Usuario.new
      comentario.queixa_id = Queixa.new
      expect(comentario.valid?).to be_truthy
    end

  end

end
