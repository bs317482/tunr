class Api::SongsController < ApplicationController
    def index
        @songs = Song.all
        render json: @songs
     end

     def create
        @songs = Song.create!(song_params)
    
        render json: @song
      end
    
      def show
        @song = Song.find(params[:id])
    
        render json: @song
      end
    
      def update
        @song = Song.find(params[:id])
        @song.update!(song_params)
    
        render json: @artist
      end
    
      def destroy
        @song = Song.find(params[:id]).delete
    
        render status: :ok
      end
    
      private
    
      def artist_params
        params.require(:song).permit(:title, :album, :preview_url, :artist)
      end
end