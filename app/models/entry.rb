class Entry
  include Mongoid::Document
  field :score, type: Integer
  field :scored_at, type: Time
  field :rank, type: Integer
  field :name, type: String
  belongs_to :user
  belongs_to :board

  validates :score, presence: true
  validates :scored_at, presence: true
  validates :rank, presence: true
  validates :name, presence: true
end
