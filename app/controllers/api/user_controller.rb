class Api::UserController < ApplicationController
  def create
    user = User.new(user_params)
    user.save

    return render json: {
      user: user.as_json
    }
  end

  def show
    user = User.find(params[:id]) if params[:id].present?
    return render json: {
      user: user.as_json(compact: true)
    } if user.present?

  rescue Mongoid::Errors::DocumentNotFound
    render nothing: true, status: 401
  end

private
  def user_params
    params.permit(:name)
  end
end
