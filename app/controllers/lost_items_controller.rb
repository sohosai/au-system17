class LostItemsController < ApplicationController
  before_action :set_lost_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :create, :update, :destroy, :search]

  # GET /lost_items
  def index
    @lost_item = LostItem.new
    @search = LostItem.ransack(params[:q])
    if params[:q]
      characteristics = params[:q][:characteristic_cont_all].split(/[\p{blank}\s]+/) unless params[:q][:characteristic_cont_all].nil?
      params[:q][:characteristic_cont_all] = characteristics if characteristics
      notes = params[:q][:note_cont_all].split(/[\p{blank}\s]+/) unless params[:q][:note_cont_all].nil?
      params[:q][:note_cont_all] = notes if notes
      @search = LostItem.ransack(params[:q])
      @lost_items = @search.result.order(created_at: :desc).page params[:page]
    else
      @lost_items = LostItem.order(created_at: :desc).page params[:page]
    end

    respond_to do |format|
      format.html
      format.csv do
        @lost_items = LostItem.all
        send_data render_to_string, filename: "lost_items.csv", type: :csv
      end
    end
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
      redirect_to lost_items_path, notice: "Lost item was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /lost_items/1
  def update
    if @lost_item.update(lost_item_params)
      redirect_to @lost_item, notice: "Lost item was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /lost_items/1
  def destroy
    @lost_item.destroy!
    redirect_to lost_items_url, notice: "Lost item was successfully destroyed."
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_lost_item
      @lost_item = LostItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lost_item_params
      params.require(:lost_item).permit(:resolver_id, :reception_desk_id,
                                        :receptionist_id, :kind,
                                        :location_lost, :characteristic,
                                        :loser_name, :loser_contact,
                                        :note, :status,
                                        :q)
    end
end
