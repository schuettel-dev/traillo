class ListItemsController < ApplicationController
  before_action :set_list_item, only: %i[ show edit update destroy ]

  # GET /list_items
  def index
    @list_items = ListItem.ordered
  end

  # GET /list_items/1
  def show
  end

  # GET /list_items/new
  def new
    @list_item = ListItem.new
  end

  # GET /list_items/1/edit
  def edit
  end

  # POST /list_items
  def create
    @list_item = ListItem.new(list_item_params)

    if @list_item.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to list_items_path, notice: "List item was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /list_items/1
  def update
    if @list_item.update(list_item_params)
      respond_to do |format|
        format.html { redirect_to list_items_path, notice: "List item was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /list_items/1
  def destroy
    @list_item.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to list_items_url, notice: "List item was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_item
      @list_item = ListItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_item_params
      params.require(:list_item).permit(:title, :description, :list_position)
    end
end
