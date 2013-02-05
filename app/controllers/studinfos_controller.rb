class StudinfosController < ApplicationController
  # GET /studinfos
  # GET /studinfos.json
   before_filter :require_administrator
   def require_administrator
      unless current_administrator
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        return false
      end
    end
  def index
    @studinfos = Studinfo.all
   

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @studinfos.map(&:attributes) }
    end

  end

  # GET /studinfos/1
  # GET /studinfos/1.json
  def show
    @studinfo = Studinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @studinfo }
    end
  end

  # GET /studinfos/new
  # GET /studinfos/new.json
  def new
    @studinfo = Studinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @studinfo }
    end
  end

  # GET /studinfos/1/edit
  def edit
    @studinfo = Studinfo.find(params[:id])
  end

  # POST /studinfos
  # POST /studinfos.json
  def create
    @studinfo = Studinfo.new(params[:studinfo])

    respond_to do |format|
      if @studinfo.save
        format.html { redirect_to @studinfo, notice: 'Studinfo was successfully created.' }
        format.json { render json: @studinfo, status: :created, location: @studinfo }
      else
        format.html { render action: "new" }
        format.json { render json: @studinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /studinfos/1
  # PUT /studinfos/1.json
  def update
    @studinfo = Studinfo.find(params[:id])

    respond_to do |format|
      if @studinfo.update_attributes(params[:studinfo])
        format.html { redirect_to @studinfo, notice: 'Studinfo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @studinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studinfos/1
  # DELETE /studinfos/1.json
  def destroy
    @studinfo = Studinfo.find(params[:id])
    @studinfo.destroy

    respond_to do |format|
      format.html { redirect_to studinfos_url }
      format.json { head :ok }
    end
  end
end
