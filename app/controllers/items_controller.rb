class ItemsController < ApplicationController
  respond_to :html, :json
  def index
    @items = Item.all
    respond_with @items
  end
end
