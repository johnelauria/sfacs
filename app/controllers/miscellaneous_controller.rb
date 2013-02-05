class MiscellaneousController < ApplicationController
  # GET /miscellaneous
  # GET /miscellaneous.json
  before_filter :require_administrator
   def require_administrator
      unless current_administrator
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        return false
      end
    end
  def index
    @miscellaneous = Miscellaneou.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @miscellaneous }
    end
  end

  # GET /miscellaneous/1
  # GET /miscellaneous/1.json
  def show
    @miscellaneou = Miscellaneou.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @miscellaneou }
    end
  end

  # GET /miscellaneous/new
  # GET /miscellaneous/new.json
  def new
    @miscellaneou = Miscellaneou.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @miscellaneou }
    end
  end

  # GET /miscellaneous/1/edit
  def edit
    @miscellaneou = Miscellaneou.find(params[:id])
  end

  # POST /miscellaneous
  # POST /miscellaneous.json
  def create
    @miscellaneou = Miscellaneou.new(params[:miscellaneou])

    respond_to do |format|
      if @miscellaneou.save
        format.html { redirect_to @miscellaneou, notice: 'Miscellaneou was successfully created.' }
        format.json { render json: @miscellaneou, status: :created, location: @miscellaneou }
      else
        format.html { render action: "new" }
        format.json { render json: @miscellaneou.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /miscellaneous/1
  # PUT /miscellaneous/1.json
  def update
    @miscellaneou = Miscellaneou.find(params[:id])

    respond_to do |format|
      if @miscellaneou.update_attributes(params[:miscellaneou])
        format.html { redirect_to @miscellaneou, notice: 'Miscellaneou was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @miscellaneou.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /miscellaneous/1
  # DELETE /miscellaneous/1.json
  def destroy
    @miscellaneou = Miscellaneou.find(params[:id])
    @miscellaneou.destroy

    respond_to do |format|
      format.html { redirect_to miscellaneous_url }
      format.json { head :ok }
    end
  end
end
