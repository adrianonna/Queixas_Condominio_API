class Comentario
  include Mongoid::Document
  include Mongoid::Timestamps
  field :descricao, type: String
  belongs_to :usuario
  has_many :arquivos
  belongs_to :queixa

  validates :descricao, presence: true
  validates :usuario_id, presence: true
  validates :queixa_id, presence: true
end
