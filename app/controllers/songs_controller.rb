class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    # byebug
    @song = Song.new
    @genres = Genre.all
  end

  def create
    # byebug
    # artist = Artist.find_or_create_by(name: params[:song_artist_name])
    # @song = Song.new(title: params[:song][:title], artist: params[:song][:song_artist_name])
    @song = Song.new(song_params)
    # byebug
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :song_artist_name, :genre_id, :song_notes_1, :song_notes_2)
  end
end

