class User
  include Mongoid::Document
  field :name, type: String
  has_one :entry

  validates :name, presence: true
end
