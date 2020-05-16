class StoriesController < ApplicationController
  def index
    @story = Story.where(acquaintancesid: params[:acquaintancesid])
    if @story != []
      render json: @story
    else
      render json: { errors: ['Storyが見つかりません'] }, status: 404
    end
  end

  def create
    @story = Story.new(content: params[:content], date: params[:date], acquaintancesid: params[:acquaintancesid])

    if @story.save
      render json: @story
    else
      render json: { errors: @story.errors.full_messages }, status: 400
    end
  end
end
