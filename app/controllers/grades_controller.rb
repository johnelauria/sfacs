class GradesController < ApplicationController
  before_filter :require_teacher
   def require_teacher
      unless current_teacher
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :teacherlogin
        return false
      end
    end

  def home
  	@teacher = Teacher.find(current_teacher.id)
  	@subjects =@teacher.subjects
  end

  def viewlist
  
  @subject=Subject.find(params[:dugas])
  @masterlist=@subject.masterlists


      end

  def catcher
       end


  def gradingsystem
    @subject=Subject.find(params[:dugas])

    if params[:duga]=="y"
     @total=params[:subject][:quiz].to_i+ params[:subject][:seatwork].to_i+params[:subject][:exam].to_i+params[:subject][:assignment].to_i+params[:subject][:project].to_i+params[:subject][:attendance].to_i+params[:subject][:recitation].to_i
     if @total==100 
           
    @subject.quiz=params[:subject][:quiz]
    @subject.seatwork=params[:subject][:seatwork]
    @subject.exam=params[:subject][:exam]
    @subject.assignment=params[:subject][:assignment]
    @subject.project=params[:subject][:project]
    @subject.attendance=params[:subject][:attendance]
    @subject.recitation=params[:subject][:recitation]
    @subject.save 
    else

    end

    else
    end

  end

  def catcher2
    respond_to do |format|
             
      @masterlist=Masterlist.find(params[:id])
      @subject=Subject.find(@masterlist.subject_id)

      if @subject.quiz.to_i< 10
        @quiz=("0.0"+@subject.quiz.to_s).to_f
      else
        @quiz=("0."+@subject.quiz.to_s).to_f
      end 

      if @subject.seatwork.to_i< 10
        @seatwork=("0.0"+@subject.seatwork.to_s).to_f
      else
        @seatwork=("0."+@subject.seatwork.to_s).to_f
      end 
      if @subject.exam.to_i< 10
        @exam=("0.0"+@subject.exam.to_s).to_f
      else
        @exam=("0."+@subject.exam.to_s).to_f
      end 
      if @subject.project.to_i< 10
        @project=("0.0"+@subject.project.to_s).to_f
      else
        @project=("0."+@subject.project.to_s).to_f
      end 
      if @subject.assignment.to_i< 10
        @assignment=("0.0"+@subject.assignment.to_s).to_f
      else
        @assignment=("0."+@subject.assignment.to_s).to_f
      end 
      if @subject.attendance.to_i< 10
        @attendance=("0.0"+@subject.attendance.to_s).to_f
      else
        @attendance=("0."+@subject.attendance.to_s).to_f
      end 
      if @subject.recitation.to_i< 10
        @recitation=("0.0"+@subject.recitation.to_s).to_f
      else
        @recitation=("0."+@subject.recitation.to_s).to_f
      end      
      
      
     
    @grade=Grade.find(@masterlist.grade_id)

    @grade.first_quarter_quiz=params[:grade][:first_quarter_quiz]
    @grade.first_quarter_assignment=params[:grade][:first_quarter_assignment]
    @grade.first_quarter_seatwork=params[:grade][:first_quarter_seatwork]
    @grade.first_quarter_exam=params[:grade][:first_quarter_exam]
    @grade.first_quarter_project=params[:grade][:first_quarter_project]
    @grade.first_quarter_recitation=params[:grade][:first_quarter_recitation]
    @grade.first_quarter_attendance=params[:grade][:first_quarter_attendance]

    @grade.second_quarter_quiz=params[:grade][:second_quarter_quiz]
    @grade.second_quarter_assignment=params[:grade][:second_quarter_assignment]
    @grade.second_quarter_seatwork=params[:grade][:second_quarter_seatwork]
    @grade.second_quarter_exam=params[:grade][:second_quarter_exam]
    @grade.second_quarter_project=params[:grade][:second_quarter_project]
    @grade.second_quarter_recitation=params[:grade][:second_quarter_recitation]
    @grade.second_quarter_attendance=params[:grade][:second_quarter_attendance]

    @grade.third_quarter_quiz=params[:grade][:third_quarter_quiz]
    @grade.third_quarter_assignment=params[:grade][:third_quarter_assignment]
    @grade.third_quarter_seatwork=params[:grade][:third_quarter_seatwork]
    @grade.third_quarter_exam=params[:grade][:third_quarter_exam]
    @grade.third_quarter_project=params[:grade][:third_quarter_project]
    @grade.third_quarter_recitation=params[:grade][:third_quarter_recitation]
    @grade.third_quarter_attendance=params[:grade][:third_quarter_attendance]

    @grade.fourth_quarter_quiz=params[:grade][:fourth_quarter_quiz]
    @grade.fourth_quarter_assignment=params[:grade][:fourth_quarter_assignment]
    @grade.fourth_quarter_seatwork=params[:grade][:fourth_quarter_seatwork]
    @grade.fourth_quarter_exam=params[:grade][:fourth_quarter_exam]
    @grade.fourth_quarter_project=params[:grade][:fourth_quarter_project]
    @grade.fourth_quarter_recitation=params[:grade][:fourth_quarter_recitation]
    @grade.fourth_quarter_attendance=params[:grade][:fourth_quarter_attendance]
    
    @grade.first_quarter=(params[:grade][:first_quarter_quiz].to_i*@quiz)+(params[:grade][:first_quarter_assignment].to_i*@assignment)+(params[:grade][:first_quarter_seatwork].to_i*@seatwork)+(params[:grade][:first_quarter_exam].to_i*@exam)+(params[:grade][:first_quarter_project].to_i*@project)+(params[:grade][:first_quarter_recitation].to_i*@recitation)+(params[:grade][:first_quarter_attendance].to_i*@attendance)

    @grade.second_quarter=(params[:grade][:second_quarter_quiz].to_i*@quiz)+(params[:grade][:second_quarter_assignment].to_i*@assignment)+(params[:grade][:second_quarter_seatwork].to_i*@seatwork)+(params[:grade][:second_quarter_exam].to_i*@exam)+(params[:grade][:second_quarter_project].to_i*@project)+(params[:grade][:second_quarter_recitation].to_i*@recitation)+(params[:grade][:second_quarter_attendance].to_i*@attendance)
    @grade.third_quarter=(params[:grade][:third_quarter_quiz].to_i*@quiz)+(params[:grade][:third_quarter_assignment].to_i*@assignment)+(params[:grade][:third_quarter_seatwork].to_i*@seatwork)+(params[:grade][:third_quarter_exam].to_i*@exam)+(params[:grade][:third_quarter_project].to_i*@project)+(params[:grade][:third_quarter_recitation].to_i*@recitation)+(params[:grade][:third_quarter_attendance].to_i*@attendance)

    @grade.fourth_quarter=(params[:grade][:fourth_quarter_quiz].to_i*@quiz)+(params[:grade][:fourth_quarter_assignment].to_i*@assignment)+(params[:grade][:fourth_quarter_seatwork].to_i*@seatwork)+(params[:grade][:fourth_quarter_exam].to_i*@exam)+(params[:grade][:fourth_quarter_project].to_i*@project)+(params[:grade][:fourth_quarter_recitation].to_i*@recitation)+(params[:grade][:fourth_quarter_attendance].to_i*@attendance)

    @grade.save 
    format.html {redirect_to grades_viewlist_path(:dugas=>params[:dugas], :id =>params[:id]), notice: 'Grade Succesfully Edited.'}
             end
           
  end






end
