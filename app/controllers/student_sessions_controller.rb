class StudentSessionsController < ApplicationController
  # GET /student_sessions
  # GET /student_sessions.json
  def index
    @student_sessions = StudentSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_sessions }
    end
  end

  # GET /student_sessions/1
  # GET /student_sessions/1.json
  def show
    @student_session = StudentSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_session }
    end
  end

  # GET /student_sessions/new
  # GET /student_sessions/new.json
  def new
    @student_session = StudentSession.new

    if current_student
       redirect_to(:profile) 
    return

    else
      if current_teacher
         redirect_to(:grades) 
         return
   
      else
        if current_cashier
           redirect_to(:home) 
    return  
        else
          if current_administrator
             redirect_to(admin_home_path) 
              return
          end
        end
      end
    end


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_session }
    end
  end

  
  # POST /student_sessions
  # POST /student_sessions.json
  def create
 
    

    respond_to do |format|
         
    
       if Student.find_by_username(params[:student_session][:username])
        @student_session = StudentSession.new(params[:student_session])
      if @student_session.save
        format.html { redirect_to(:profile, :notice => 'WELCOME.') }
        format.json { render json: @student_session, status: :created, location: @student_session }
      else
         format.html { redirect_to(:login, :notice => 'Incorrect Username or Password') }
      end
      else
        if Cashier.find_by_username(params[:student_session][:username])
        @cashier_session = CashierSession.new(params[:student_session])
        if @cashier_session.save
        format.html { redirect_to(:home, :notice => 'Cashier session was successfully created.') }
        format.json { render json: @cashier_session, status: :created, location: @cashier_session }
      else
         format.html { redirect_to(:login, :notice => 'Incorrect Username or Password') }
      end
    else
        if Teacher.find_by_username(params[:student_session][:username])
          @teacher_session = TeacherSession.new(params[:student_session])

      if @teacher_session.save
        format.html { redirect_to(:grades, :notice => 'Teacher session was successfully created.') }
        format.json { render json: @teacher_session, status: :created, location: @teacher_session }
      else
         format.html { redirect_to(:login, :notice => 'Incorrect Username or Password') }
      end
    else
      if Administrator.find_by_username(params[:student_session][:username])
        @administrator_session = AdministratorSession.new(params[:student_session])
        
      if @administrator_session.save
        format.html { redirect_to(admin_home_path, :notice => 'Welcome Admin.') }
        format.json { render json: @administrator_session, status: :created, location: @administrator_session }
      else
         format.html { redirect_to(:login, :notice => 'Incorrect Username or Password') }
      end
    else
         format.html { redirect_to(:login, :notice => 'Incorrect Username or Password') }
end
    end
  end
    end
end
  

  end

   # DELETE /student_sessions/1
  # DELETE /student_sessions/1.json
  def destroy
    @student_session = StudentSession.find
    @student_session.destroy

    respond_to do |format|
      format.html { redirect_to(:login , :notice => 'Goodbye!') }
      format.json { head :ok }
    end
  end
end
