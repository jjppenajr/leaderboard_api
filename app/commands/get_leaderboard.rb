class GetLeaderboard
  prepend SimpleCommand

  attr_reader :board, :per_page, :page

  def initialize(board_id:, per_page:, page:)
    @board = Board.find_by(id: board_id)
    @per_page = per_page
    @page = page
  end

  def call
    return nil, nil if board.nil? || per_page.nil? || page.nil?
    return get_leaderboard, board
  end

private
  def get_leaderboard
    entries = board.entries.order(score: :desc).limit(per_page).offset(page)
  end
end