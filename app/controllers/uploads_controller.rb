class UploadsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :search, :show]

  def index
    @uploads = Upload.order("created_at DESC").page params[:page]
  end

  def search
    @uploads = Upload.tagged_with(params[:query]).page params[:page]
    render :action => :index
  end

  def show
    @upload = Upload.find(params[:id])
    @upload.increment!(:views)
  end

  def new
    @upload = current_user.uploads.new
  end

  def edit
    @upload = Upload.find(params[:id])
  end

  def create
    @upload = current_user.uploads.new(params[:upload])

    if @upload.save
      redirect_to @upload, notice: 'Upload was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @upload = Upload.find(params[:id])

    if @upload.update_attributes(params[:upload])
      redirect_to @upload, notice: 'Upload was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy

    redirect_to uploads_url
  end
end
