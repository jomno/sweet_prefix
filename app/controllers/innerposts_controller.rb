class InnerpostsController < ApplicationController
  before_action :set_innerpost, only: [:show, :edit, :update, :destroy]

  # GET /innerposts
  # GET /innerposts.json
  def index
    @innerposts = Innerpost.all
  end

  # GET /innerposts/1
  # GET /innerposts/1.json
  def show
  end

  # GET /innerposts/new
  def new
    @innerpost = Innerpost.new
  end

  # GET /innerposts/1/edit
  def edit
  end

  # POST /innerposts
  # POST /innerposts.json
  def create
    @innerpost = Innerpost.new(innerpost_params)

    respond_to do |format|
      if @innerpost.save
        format.html { redirect_to @innerpost, notice: 'Innerpost was successfully created.' }
        format.json { render :show, status: :created, location: @innerpost }
      else
        format.html { render :new }
        format.json { render json: @innerpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /innerposts/1
  # PATCH/PUT /innerposts/1.json
  def update
    respond_to do |format|
      if @innerpost.update(innerpost_params)
        format.html { redirect_to @innerpost, notice: 'Innerpost was successfully updated.' }
        format.json { render :show, status: :ok, location: @innerpost }
      else
        format.html { render :edit }
        format.json { render json: @innerpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /innerposts/1
  # DELETE /innerposts/1.json
  def destroy
    @innerpost.destroy
    respond_to do |format|
      format.html { redirect_to innerposts_url, notice: 'Innerpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_innerpost
      @innerpost = Innerpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def innerpost_params
      params.require(:innerpost).permit(:title, :content, :post_id)
    end
end
