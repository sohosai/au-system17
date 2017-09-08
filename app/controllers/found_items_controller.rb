class FoundItemsController < ApplicationController
  before_action :set_found_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :create, :update, :destroy]

  # GET /found_items
  def index
    @found_items = FoundItem.all
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
      redirect_to @found_item, notice: "Found item was successfully created."
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

  def search
    @search = FoundItem.ransack(params[:q])
    if params[:q]
      @found_items = @search.result
    end
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
                                         :note, :status)
    end
end
