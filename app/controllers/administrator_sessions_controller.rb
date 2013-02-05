class AdministratorSessionsController < ApplicationController
  # GET /administrator_sessions
  # GET /administrator_sessions.json
 

  # GET /administrator_sessions/new
  # GET /administrator_sessions/new.json
  def new
    @administrator_session = AdministratorSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @administrator_session }
    end
  end

  
  # POST /administrator_sessions
  # POST /administrator_sessions.json
  def create
    @administrator_session = AdministratorSession.new(params[:administrator_session])

    respond_to do |format|
      if @administrator_session.save
        format.html { redirect_to @administrator_session, notice: 'Administrator session was successfully created.' }
        format.json { render json: @administrator_session, status: :created, location: @administrator_session }
      else
        format.html { render action: "new" }
        format.json { render json: @administrator_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /administrator_sessions/1
  # PUT /administrator_sessions/1.json
  

  # DELETE /administrator_sessions/1
  # DELETE /administrator_sessions/1.json
  def destroy
    @administrator_session = AdministratorSession.find
    @administrator_session.destroy

    respond_to do |format|
      format.html { redirect_to :login }
      format.json { head :ok }
    end
  end
end
