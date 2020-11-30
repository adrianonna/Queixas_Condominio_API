class Queixa
  include Mongoid::Document
  include Mongoid::Timestamps
  field :tipo, type: String
  field :gravidade, type: String
  field :titulo, type: String
  field :descricao, type: String
  field :privacidade, type: Mongoid::Boolean, default: false
  field :criado_por, type: String
  has_and_belongs_to_many :usuarios
  has_many :comentarios, dependent: :destroy
  belongs_to :status

  validates :tipo, presence: true
  validates :titulo, presence: true
  validates :descricao, presence: true

end
