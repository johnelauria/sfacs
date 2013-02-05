class ApplicationController < ActionController::Base
 protect_from_forgery
  
  helper_method :current_student
  helper_method :current_teacher
  helper_method :current_cashier
  helper_method :current_administrator
  private
  
  def current_student_session
    return @current_student_session if defined?(@current_student_session)
    @current_student_session = StudentSession.find
  end
  
  def current_student
    return @current_student if defined?(@current_student)
    @current_student = current_student_session && current_student_session.record
  end

   def current_teacher_session
    return @current_teacher_session if defined?(@current_teacher_session)
    @current_teacher_session = TeacherSession.find
  end
  
  def current_teacher
    return @current_teacher if defined?(@current_teacher)
    @current_teacher = current_teacher_session && current_teacher_session.record
  end


def current_cashier_session
    return @current_cashier_session if defined?(@current_cashier_session)
    @current_cashier_session = CashierSession.find
  end
  
  def current_cashier
    return @current_cashier if defined?(@current_cashier)
    @current_cashier = current_cashier_session && current_cashier_session.record
  end

def current_administrator_session
    return @current_administrator_session if defined?(@current_administrator_session)
    @current_administrator_session = AdministratorSession.find
  end
  
  def current_administrator
    return @current_administrator if defined?(@current_administrator)
    @current_administrator = current_administrator_session && current_administrator_session.record
  end


end
