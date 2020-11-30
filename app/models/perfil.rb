class Perfil
  include Mongoid::Document
  include Mongoid::Timestamps
  field :tipo, type: String
  has_one :usuario

  validates :tipo, presence: true
end
