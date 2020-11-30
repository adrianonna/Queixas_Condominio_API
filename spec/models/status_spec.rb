require 'rails_helper'

RSpec.describe Status, type: :model do

  context 'Valores de Status' do

    it 'Status não válido' do
      status = Status.new
      expect(status.valid?).to be_falsey
    end

    it 'Criação de um Status' do
      status = Status.new
      status.estado = 'Estado'
      expect(status.valid?).to be_truthy
    end

  end

end
