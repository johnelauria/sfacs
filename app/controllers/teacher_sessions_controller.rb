class TeacherSessionsController < ApplicationController
  # GET /teacher_sessions
  # GET /teacher_sessions.json
 

  # GET /teacher_sessions/1
  # GET /teacher_sessions/1.json
    # GET /teacher_sessions/new
  # GET /teacher_sessions/new.json
  def new
    @teacher_session = TeacherSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teacher_session }
    end
  end

  # GET /teacher_sessions/1/edit
   # POST /teacher_sessions
  # POST /teacher_sessions.json
  def create
    @teacher_session = TeacherSession.new(params[:teacher_session])

    respond_to do |format|
      if @teacher_session.save
        format.html { redirect_to(:grades, :notice => 'Teacher session was successfully created.') }
        format.json { render json: @teacher_session, status: :created, location: @teacher_session }
      else
        format.html { render action: "new" }
        format.json { render json: @teacher_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teacher_sessions/1
  # PUT /teacher_sessions/1.json
    # DELETE /teacher_sessions/1
  # DELETE /teacher_sessions/1.json
  def destroy
    @teacher_session = TeacherSession.find
    @teacher_session.destroy

    respond_to do |format|
      format.html { redirect_to(:login) }
      format.json { head :ok }
    end
  end
end
