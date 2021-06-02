class ExplorersController < ApplicationController
  before_action :set_explorer, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except:[:index, :show]
  before_action :corrent_user, only:[:edit, :update, :destroy]
  # GET /explorers or /explorers.json
  def index
    @explorers = Explorer.all
  end

  # GET /explorers/1 or /explorers/1.json
  def show
  end

  # GET /explorers/new
  def new
    #@explorer = Explorer.new
    @explorer = current_user.explorers.build
  end

  # GET /explorers/1/edit
  def edit
  end

  # POST /explorers or /explorers.json
  def create
    #@explorer = Explorer.new(explorer_params)
    @explorer = current_user.explorers.build(explorer_params)

    respond_to do |format|
      if @explorer.save
        format.html { redirect_to @explorer, notice: "Explorer was successfully created." }
        format.json { render :show, status: :created, location: @explorer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @explorer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /explorers/1 or /explorers/1.json
  def update
    respond_to do |format|
      if @explorer.update(explorer_params)
        format.html { redirect_to @explorer, notice: "Explorer was successfully updated." }
        format.json { render :show, status: :ok, location: @explorer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @explorer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /explorers/1 or /explorers/1.json
  def destroy
    @explorer.destroy
    respond_to do |format|
      format.html { redirect_to explorers_url, notice: "Explorer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def corrent_user
    @explorer = current_user.explorers.find_by(id: params[:id])
    redirect_to explorers_path, notice: "Not Authorized to Edit This Explorer" if @explorer.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_explorer
      @explorer = Explorer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def explorer_params
      params.require(:explorer).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
