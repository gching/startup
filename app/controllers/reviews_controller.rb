class ReviewsController < ApplicationController
  # GET /photo_uploads
  # GET /photo_uploads.json
  def index

    @reviews = Review.all

  end

  # GET /photo_uploads/new
  # GET /photo_uploads/new.json
  def new
    @review= Review.new
    @user = User.find(params[:user_id])

  end

  def show
    @review = Review.find(params[:id])
    @user = User.find(@review.user_id)
  end


  # POST /photo_uploads
  # POST /photo_uploads.json
  def create
    @review= Review.new(params[:review])
    @user = User.find(params[:review][:user_id])

    respond_to do |format|
      if @review.save
        format.html { redirect_to @user, notice: 'Review was successfully uploaded.' }
        format.json { render json: @review, status: :created, location: @review }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_uploads/1
  # DELETE /photo_uploads/1.json
  def destroy
    @review = Review.find(params[:id])
    @user = User.find(params[:user_id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to @user, notice: 'The photo was successfully deleted.'}
      format.json { head :no_content }
    end
  end
end
