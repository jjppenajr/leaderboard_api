class LeaderboardSerializer < ActiveModel::Serializer
  attributes :id, :name, :entries

  # def entries
  #   entries = board.entries.order(score: :desc).limit(per_page).offset(page)
  #   entries.each do |entry|
  #     LeaderboardEntrySerializer.new(entry)
  #   end
  # end
end
