class PhotosController < ApplicationController
  # GET /photo_uploads
  # GET /photo_uploads.json
  def index

    @photos = Photo.all

  end

  # GET /photo_uploads/new
  # GET /photo_uploads/new.json
  def new
    @photo= Photo.new
    @user = User.find(params[:user_id])

  end


  # POST /photo_uploads
  # POST /photo_uploads.json
  def create
    @photo= Photo.new(params[:photo])
    @user = User.find(params[:photo][:user_id])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @user, notice: 'Photo was successfully uploaded.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_uploads/1
  # DELETE /photo_uploads/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @user = User.find(params[:user_id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to @user, notice: 'The photo was successfully deleted.'}
      format.json { head :no_content }
    end
  end
end
