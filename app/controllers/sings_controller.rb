class SingsController < ApplicationController
  def index 
    @sings = Sing.all 
    render :index
  end
  def show 
    @sing = Sing.find_by(id: params[:id])
    render :show
  end
  def create
    @sing = Sing.new(
      title: params[:title],
      album: params[:album], 
      artist: params[:artist], 
      year: params[:year], 
      created_at: params[:created_at],
      updated_at: params[:updated_at]
    )
    @sing.save
    render :show
  end 
  def update
    @sing = Sing.find_by(id: params[:id])
    @sing.update( 
      title: params[:title] || @sing.title,
      album: params[:album] || @sing.album,
      artist: params[:artist] || @sing.artist, 
      year: params[:year] || @sing.year, 
      created_at: params[:created_at] || @sing.created_at, 
      updated_at: params[:updated_at] || @sing.updated_at
    )
    render :show
  end
  def destroy 
    @sing = Sing.find_by(id: params[:id])
    @sing.destroy 
    render json: { message: "The item has been removed." }
  end
end
