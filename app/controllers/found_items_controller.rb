class FoundItemsController < ApplicationController
  before_action :set_found_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :create, :update, :destroy, :search]

  # GET /found_items
  def index
    @found_item = FoundItem.new
    @search = FoundItem.ransack(params[:q])
    if params[:q]
      characteristics = params[:q][:characteristic_cont_all].split(/[\p{blank}\s]+/) unless params[:q][:characteristic_cont_all].nil?
      params[:q][:characteristic_cont_all] = characteristics if characteristics
      notes = params[:q][:note_cont_all].split(/[\p{blank}\s]+/) unless params[:q][:note_cont_all].nil?
      params[:q][:note_cont_all] = notes if notes
      @search = FoundItem.ransack(params[:q])
      @found_items = @search.result.order(created_at: :desc).page params[:page]
    else
      @found_items = FoundItem.order(created_at: :desc).page params[:page]
    end

    respond_to do |format|
      format.html
      format.csv do
        @found_items = FoundItem.all
        send_data render_to_string, filename: "found_items.csv", type: :csv
      end
    end
  end

  # GET /found_items/1
  def show
  end

  # GET /found_items/new
  def new
    @found_item = FoundItem.new
  end

  # GET /found_items/1/edit
  def edit
  end

  # POST /found_items
  def create
    @found_item = FoundItem.new(found_item_params)

    if @found_item.save
      redirect_to found_items_path, notice: "Found item was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /found_items/1
  def update
    if @found_item.update(found_item_params)
      redirect_to @found_item, notice: "Found item was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /found_items/1
  def destroy
    @found_item.destroy!
    redirect_to found_items_url, notice: "Found item was successfully destroyed."
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_found_item
      @found_item = FoundItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def found_item_params
      params.require(:found_item).permit(:resolver_id, :reception_desk_id,
                                         :receptionist_id, :kind,
                                         :location_found, :characteristic,
                                         :finder_name, :finder_contact,
                                         :note, :status,
                                         :q)
    end
end
