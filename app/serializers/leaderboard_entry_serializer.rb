class LeaderboardEntrySerializer < ActiveModel::Serializer
  attributes :score, :user_id, :scored_at, :rank, :name
end