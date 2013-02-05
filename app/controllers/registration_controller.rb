class RegistrationController < ApplicationController
  def register
  	@student=Studinfo.find_by_studnum(params[:id])
  
  

  	

  end

  def catcher
  end

  def roadblock
    
  	@studentinfo=Studinfo.where("studnum =? AND email =?", params[:studnum], params[:email])
  	if @studentinfo.exists?
  		  	
     @student=Studinfo.find(@studentinfo)
      respond_to do |format|
      format.html {redirect_to new_student_path(:id => @student), notice: 'Incorrect Student Number or Email.'}
      end   

    else
    
     respond_to do |format|
      format.html {redirect_to registration_catcher_path, notice: 'Incorrect Student Number or Email.'}
      end 
   
    end
     	
  end

end
