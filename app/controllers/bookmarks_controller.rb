class BookmarksController < ApplicationController
  # GET/bookmark/new
  def new
    @bookmark = Bookmark.new
  end
  # POST/bookmark
  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to @bookmark, notice: 'Bookmark was sucessfully created.'
    else
      render :new
    end
  end

  # DELETE/boookmark/1
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_url, notice: 'Bookmark was sucessfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
