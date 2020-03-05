class Board
  include Mongoid::Document
  field :name, type: String
  has_many :entries

  validates :name, presence: true

  def board_hash(new_entries)
    {
      _id: id,
      name: name,
      entries: new_entries.each_with_index.map{|e,i| e.board_hash(i)}
    }
  end
end
