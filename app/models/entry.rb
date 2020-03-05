class Entry
  include Mongoid::Document
  field :score, type: Integer
  field :scored_at, type: DateTime
  belongs_to :user
  belongs_to :board

  delegate :name, to: :user

  before_save :timestamp_scored_at

  validates :score, presence: true

  def board_hash(rank)
    bh = self.as_json
    bh[:rank] = rank
    bh
  end
private
  def timestamp_scored_at
    self.scored_at = DateTime.now
  end
end
