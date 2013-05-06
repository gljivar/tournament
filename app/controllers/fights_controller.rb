require 'SocketIO'

class FightsController < ApplicationController
respond_to :json
skip_before_filter :require_login , :only => [:index, :show]

  # GET /fights
  # GET /fights.json
  def index
    @fights = Fight.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fights.to_json( :include => { :field_initial => { :only => [:name] }, :field_actual => { :only => [:name] }, :category => { :only => [:name] }, :competitor_blue => { :only => [:last_name, :lot_number] }, :competitor_red => { :only => [:last_name, :lot_number] }, :competitor_winner => { :only => [:last_name, :lot_number] }, :previous_fight_blue => { :only => [:id, :number], :include => { :field_initial => { :only => [:name] } } }, :previous_fight_red => { :only => [:id, :number], :include => { :field_initial => { :only => [:name] } } } } ) }
    end
  end

  # GET /fights/1
  # GET /fights/1.json
  def show
    @fight = Fight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fight.to_json( :include => { :field_initial => { :only => [:name] }, :field_actual => { :only => [:name] }, :category => { :only => [:name] }, :competitor_blue => { :only => [:last_name, :lot_number] }, :competitor_red => { :only => [:last_name, :lot_number] }, :competitor_winner => { :only => [:last_name, :lot_number] }, :previous_fight_blue => { :only => [:id, :number], :include => { :field_initial => { :only => [:name] } } }, :previous_fight_red => { :only => [:id, :number], :include => { :field_initial => { :only => [:name] } } } } ) }

    end
  end

  # GET /fights/new
  # GET /fights/new.json
  def new
    @fight = Fight.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fight }
    end
  end

  # GET /fights/1/edit
  def edit
    @fight = Fight.find(params[:id])
  end

  # POST /fights
  # POST /fights.json
  def create
    @fight = Fight.new(params[:fight])

    respond_to do |format|
      if @fight.save
        format.html { redirect_to @fight, notice: 'Fight was successfully created.' }
        format.json { render json: @fight, status: :created, location: @fight }
      else
        format.html { render action: "new" }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fights/1
  # PUT /fights/1.json
  def update
    @fight = Fight.find(params[:id])
    
    secret = '9f8urg90$u3#92u8rh_gu(rfhi8rj*fih'
	begin
		client = SocketIO.connect("http://localhost:8190") do
		  after_start do
			obj = { :secret => secret, :action => 'fight', :info => { :status => 'changed' } }
			emit("tournament-ruby", obj)
			disconnect 
		  end
		end
	rescue
	end

    respond_to do |format|
      if @fight.update_attributes(params[:fight])
        format.html { redirect_to @fight, notice: 'Fight was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fights/1
  # DELETE /fights/1.json
  def destroy
    @fight = Fight.find(params[:id])
    @fight.destroy

    respond_to do |format|
      format.html { redirect_to fights_url }
      format.json { head :no_content }
    end
  end
end
