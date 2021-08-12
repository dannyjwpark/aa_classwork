class ArtworkController < ApplicationController
    def index
        @artwork = Artwork.all
        render json: @artwork
    end

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: unprocessable_entity
        end
    end


    def show
        @artwork = Artwork.find_by(id: params[:id])
        render json: @artwork
    end

    def update
        artwork = Artwork.find_by(id: params[:id])
        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])
        if artwork.destroy
            redirect_to artwork_url(artwork)
        else
            render json: artwork.errors.full_messages, status: unprocessable_entity
        end
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end


end

# artworks GET    /artworks(.:format)                   artworks#index
# POST   /artworks(.:format)                   artworks#create
# artwork GET    /artworks/:id(.:format)               artworks#show
# PATCH  /artworks/:id(.:format)               artworks#update
# PUT    /artworks/:id(.:format)               artworks#update
# DELETE /artworks/:id(.:format)               artworks#destroy