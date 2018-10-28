class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource

  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :available_rooms, only: [:show, :index]

  # GET /rooms
  # GET /rooms.json
  def index
    if params[:q]
      search_term = params[:q]
      @rooms = Room.search(search_term)
      if @rooms.empty?
        flash.now[:notice] = "Sorry, nothing matched '#{search_term}'. Try these instead!"
        @rooms = Room.all
        rooms_url
      end
    else
      rooms_url
    end


  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    Rails.logger.info "#{'$'*80}"
    Rails.logger.info "@rooms #{@rooms}"
    @messages = @room.messages.order(created_at: :desc)
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    def available_rooms
      @rooms = Room.all.order(name: :asc) #this is where pagination would go
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :subject)
    end
end
