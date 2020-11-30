class Status
  include Mongoid::Document
  include Mongoid::Timestamps
  field :estado, type: String
  has_one :queixa

  validates :estado, presence: true

end
