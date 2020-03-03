class Api::UserController < ApplicationController
  def create
    user = User.new(user_params)
    user.save

    return render json: {
      user: user.as_json(compact: true),
      errors: user.errors.full_messages.join(", ")
    }
  end

  def show
    user = User.find(params[:id]) if params[:id].present?

    return render json: {
      user: user.as_json(compact: true) || {},
      errors: "User does not exist."
    }
  end

private
  def user_params
    params.permit(:name)
  end
end
