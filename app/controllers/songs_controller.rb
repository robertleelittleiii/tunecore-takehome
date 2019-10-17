class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
  # GET /songs/search
  def search
    # @search = {}
    # @search_params = search_params
    # @results = Song.search(@search_params)
  end
  
  # GET /songs/find
  def find
    @search = search_params
    @order = order_params
      
    #init_session
    
    puts("session[:current_sort_order]:#{session[:current_sort_order]}")
    
    session[:current_sort_order] = @order.present? ? @order[:direction] : 'asc'
    session[:current_sort_field] = @order.present? ? @order[:by] : 'song_title'
     
    
    @results = Song.search(@search, @order).paginate(page: params[:page])
    
     
    respond_to do |format|
      format.html { render :layout => false}
      format.json { render :body=> @results.to_json } #raw json dump
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_song
    @song = Song.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def song_params
    params.require(:song).permit(:song_title, :artist_id, :album_id)
  end
    
  def search_params
    params.require(:search).permit(:song_title, :artist_name, :album_title)
  end
    
  def order_params
    params[:sort].permit(:by, :direction) if params[:sort].present?
  end
  
  def init_session
    session[:current_sort_order] = 'asc' if session[:current_sort_order].blank?
    session[:current_sort_field] = 'song_title' if session[:current_sort_field].blank?
  end
end
