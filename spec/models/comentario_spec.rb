require 'rails_helper'

RSpec.describe Comentario, type: :model do

  context 'Valores de Comentário' do

    it 'Comentário não válido' do
      comentario = Comentario.new
      expect(comentario.valid?).to be_falsey
    end

    # it 'Criação de um Comentario' do
    #   comentario = Comentario.new
    #   comentario.descricao = 'Descrição'
    #   comentario.usuario_id = '5fb417be4debe728b0edb9a5'
    #   comentario.queixa_id = '5fbd75593ca5732d6c6370c5'
    #   expect(comentario.valid?).to be_truthy
    # end

  end

end
