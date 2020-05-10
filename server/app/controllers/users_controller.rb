# app/controllers/users_controller.rb
class UsersController < ApplicationController
  skip_before_action :authenticate!, only: [ :create, :sign_in ]
  def create
    @user = User.new(name: params[:name], pwd: params[:pwd])

    if @user.save
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
  end

  def sign_in
    login_user = User.find_by(name:params[:name],pwd:params[:pwd])
    if login_user != nil
      render json: {id: login_user.id, name: login_user.name, token: login_user.token}
    else
      render json: { errors: ['ログインに失敗しました'] }, status: 401
    end
  end

  def me
    render json: current_user
  end
end
