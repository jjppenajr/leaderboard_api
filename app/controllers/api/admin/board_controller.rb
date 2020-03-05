class Api::Admin::BoardController < ApplicationController
  def create
    board = Board.new(board_params)
    board.save

    return render json: {
      user: board.as_json
    }
  end

  def add_score
    command = UserEntry.call(
      user_id: add_score_params[:user_id],
      board_id: add_score_params[:id],
      score_to_add: add_score_params[:score_to_add]
    )

    return render json: {
      entry: command.result.as_json
    } if command.result

    render nothing: true, status: 401
  end

  def leaderboard
    command = GetLeaderboard.call(
      board_id: leaderboard_params[:id],
      per_page: leaderboard_params[:per_page],
      page: leaderboard_params[:page]
    )
    return render json: {
      board: command.result[1].board_hash(command.result[0])
    } if !command.result[0].nil?

    return render nothing: true, status: 401
  end

private
  def board_params
    params.permit(:name)
  end

  def add_score_params
    params.permit(:id, :score_to_add, :user_id, :score_to_add)
  end

  def leaderboard_params
    params.permit(:id, :per_page, :page)
  end
end
