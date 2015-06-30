class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  #def index
   # @items = Item.all


  #end

  def index
    @items = Item.all
    
    #item_id = Random.rand(1..Item.count)
    # @item = Item.find(item_id)
    # unless Item.has_dates == false || Item.completion == false
    #   puts "unless avoided"
    #   while @item.due_date.blank? || @item.is_complete
    #     item_id = Random.rand(1..Item.count)
    #     @item = Item.find(item_id)
    #   end
    # end

    #@item = Item.where(:is_complete => false).where.not(:due_date => nil).order("RANDOM()").first
  end


  def date
    @items = Item.all
  end

  # GET /items/1
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  def search
    @items = Item.search(params[:word])
  end

  # POST /items
  def create
    @item = Item.create(item_params)

    respond_to do |format|
      if @item.save
        format.html {redirect_to root_path, notice: 'Task was successfully created.' }
      else
        format.html { render :new } 
      end
    end
  end

  # PATCH/PUT /items/1
  def update
    respond_to do |format|
      if @item.update(item_params)
        redirect_to @item, notice: 'Item was successfully updated.' 
      else
        render :edit 
      end
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    respond_to do |format|
      redirect_to items_url, notice: 'Item was successfully destroyed.' 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:task, :due_date, :is_complete, :list_id)
    end
  end

