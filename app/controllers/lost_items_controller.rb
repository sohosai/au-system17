class LostItemsController < ApplicationController
  before_action :set_lost_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :create, :update, :destroy]

  # GET /lost_items
  def index
    @lost_items = LostItem.all
  end

  # GET /lost_items/1
  def show
  end

  # GET /lost_items/new
  def new
    @lost_item = LostItem.new
  end

  # GET /lost_items/1/edit
  def edit
  end

  # POST /lost_items
  def create
    @lost_item = LostItem.new(lost_item_params)

    if @lost_item.save
      redirect_to @lost_item, notice: 'Lost item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /lost_items/1
  def update
    if @lost_item.update(lost_item_params)
      redirect_to @lost_item, notice: 'Lost item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lost_items/1
  def destroy
    @lost_item.destroy
    redirect_to lost_items_url, notice: 'Lost item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lost_item
      @lost_item = LostItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lost_item_params
      params.require(:lost_item).permit(:resolver_id, :resolved_at, :reception_desk_id, :receptionist_id, :name, :kind, :location_lost, :characteristic, :loser_name, :loser_name, :note)
    end
end
