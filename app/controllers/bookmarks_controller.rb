class BookmarksController < ApplicationController
  # GET/bookmark/new
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end
  # POST/bookmark
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was sucessfully created.'
    else
      render :new
    end
  end

  # DELETE/boookmark/1
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: 'Bookmark was sucessfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
