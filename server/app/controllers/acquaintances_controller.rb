class AcquaintancesController < ApplicationController

  def index
    @acquaintance = Acquaintance.where(user_id: params[:user_id]).limit(10)
    render json: @acquaintance
  end

  def create
    @acquaintance = Acquaintance.new(user_id: params[:user_id], name: params[:name], nickname: params[:nickname])

    if @acquaintance.save
      render json: @acquaintance
    else
      render json: { errors: @acquaintance.errors.full_messages }, status: 400
    end
  end

  def search
    @acquaintance = Acquaintance.where(user_id: params[:user_id]).where(name: params[:name]).or(Acquaintance.where(user_id: params[:user_id]).where(nickname: params[:nickname]))
    if @acquaintance != []
      render json: @acquaintance
    else
      render json: { errors: ['ユーザーが見つかりません'] }, status: 404
    end
  end
end
