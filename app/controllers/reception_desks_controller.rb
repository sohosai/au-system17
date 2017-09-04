class ReceptionDesksController < ApplicationController
  before_action :set_reception_desk, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :create, :update, :destroy]

  # GET /reception_desks
  def index
    @reception_desks = ReceptionDesk.all
  end

  # GET /reception_desks/1
  def show
  end

  # GET /reception_desks/new
  def new
    @reception_desk = ReceptionDesk.new
  end

  # GET /reception_desks/1/edit
  def edit
  end

  # POST /reception_desks
  def create
    @reception_desk = ReceptionDesk.new(reception_desk_params)

    if @reception_desk.save
      redirect_to @reception_desk, notice: 'Reception desk was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reception_desks/1
  def update
    if @reception_desk.update(reception_desk_params)
      redirect_to @reception_desk, notice: 'Reception desk was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reception_desks/1
  def destroy
    @reception_desk.destroy
    redirect_to reception_desks_url, notice: 'Reception desk was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reception_desk
      @reception_desk = ReceptionDesk.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reception_desk_params
      params.require(:reception_desk).permit(:name, :location)
    end
end
