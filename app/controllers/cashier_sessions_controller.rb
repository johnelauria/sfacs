class CashierSessionsController < ApplicationController
  


  # GET /cashier_sessions/new
  # GET /cashier_sessions/new.json
  def new
    @cashier_session = CashierSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cashier_session }
    end
  end
  # POST /cashier_sessions
  # POST /cashier_sessions.json
  def create
    @cashier_session = CashierSession.new(params[:cashier_session])

    respond_to do |format|
      if @cashier_session.save
        format.html { redirect_to(:home, :notice => 'Cashier session was successfully created.') }
        format.json { render json: @cashier_session, status: :created, location: @cashier_session }
      else
        format.html { render action: "new" }
        format.json { render json: @cashier_session.errors, status: :unprocessable_entity }
      end
    end
  end

   # DELETE /cashier_sessions/1
  # DELETE /cashier_sessions/1.json
  def destroy
    @cashier_session = CashierSession.find
    @cashier_session.destroy

    respond_to do |format|
      format.html { redirect_to(:login , :notice => 'Goodbye!') }
      format.json { head :ok }
    end
  end
end
