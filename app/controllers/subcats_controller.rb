class SubcatsController < ApplicationController
  before_action :set_subcat, only: [:show, :edit, :update, :destroy]

  # GET /subcats
  # GET /subcats.json
  def index
    @subcats = Category.find(params[:category_id]).subcats.all
  end

  # GET /subcats/1
  # GET /subcats/1.json
  def show
  end

  # GET /subcats/new
  def new
    @category = Category.find(params[:category_id])
    @subcat = @category.subcats.build
  end

  # GET /subcats/1/edit
  def edit
  end

  # POST /subcats
  # POST /subcats.json
  def create
    @category = Category.find(params[:category_id])
    @subcat = @category.subcats.build(subcat_params)

    respond_to do |format|
      if @subcat.save
        format.html { redirect_to category_subcat_path(params[:category_id], @subcat.id), notice: 'Subcat was successfully created.' }
        format.json { render :show, status: :created, location: @subcat }
      else
        format.html { render :new }
        format.json { render json: @subcat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subcats/1
  # PATCH/PUT /subcats/1.json
  def update
    respond_to do |format|
      if @subcat.update(subcat_params)
        format.html { redirect_to category_subcat_path(@subcat.category, @subcat.id), notice: 'Subcat was successfully updated.' }
        format.json { render :show, status: :ok, location: @subcat }
      else
        format.html { render :edit }
        format.json { render json: @subcat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcats/1
  # DELETE /subcats/1.json
  def destroy
    @subcat.destroy
    respond_to do |format|
      format.html { redirect_to @subcat.category, notice: 'Subcat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcat
      @subcat = Subcat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subcat_params
      params.require(:subcat).permit(:subcat_name, :category_id)
    end
end
