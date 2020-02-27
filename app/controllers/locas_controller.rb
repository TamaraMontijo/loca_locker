class LocasController < ApplicationController
  before_action :set_loca, only: [ :edit, :update, :destroy]

  # GET /locas
  # GET /locas.json
  def index
    @locas = Loca.geocoded

    @markers = @locas.map do | loca |
      {
        lat: loca.latitude,
        lng: loca.longitude
      }
    end
  end

  # GET /locas/1
  # GET /locas/1.json
  def show
    @locas = Loca.find(params)
  end

  # GET /locas/new
  def new
    @loca = Loca.new
  end

  # GET /locas/1/edit
  def edit
  end

  # POST /locas
  # POST /locas.json
  def create
    @loca = Loca.new(loca_params)

    respond_to do |format|
      if @loca.save
        format.html { redirect_to @loca, notice: 'Loca was successfully created.' }
        format.json { render :show, status: :created, location: @loca }
      else
        format.html { render :new }
        format.json { render json: @loca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locas/1
  # PATCH/PUT /locas/1.json
  def update
    respond_to do |format|
      if @loca.update(loca_params)
        format.html { redirect_to @loca, notice: 'Loca was successfully updated.' }
        format.json { render :show, status: :ok, location: @loca }
      else
        format.html { render :edit }
        format.json { render json: @loca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locas/1
  # DELETE /locas/1.json
  def destroy
    @loca.destroy
    respond_to do |format|
      format.html { redirect_to locas_url, notice: 'Loca was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loca
      @loca = Loca.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loca_params
      params.require(:loca).permit(:name, :address)
    end
end
