class UserEntry
  prepend SimpleCommand

  attr_reader :score_to_add, :board, :user

  def initialize(score_to_add:, board_id:, user_id:)
    @score_to_add = score_to_add
    @board = Board.find_by(id: board_id)
    @user = User.find_by(id: user_id)
  end

  def call
    return nil if user.nil? || board.nil?
    entry = check_existing_entry
    return new_entry if entry.nil?
    return entry
  end

private
  def new_entry
    entry = Entry.new(entry_params)
    return entry if entry.save

    errors.add :base, entry.errors.full_messages.join(", ")
    return nil
  end

  def check_existing_entry
    entry = Entry.find_by(user_id: user.id)

    return entry if entry.present? && entry.update(score: entry.score + score_to_add.to_i)
    return nil
  end

  def entry_params
    {
      board_id: board&.id,
      user_id: user&.id,
      score: score_to_add.to_i
    }
  end
end