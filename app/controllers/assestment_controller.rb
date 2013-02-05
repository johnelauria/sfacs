class AssestmentController < ApplicationController
 before_filter :require_student
   def require_student
      unless current_student
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        return false
      end
    end
 
 
  def profile

  	@student = Student.find(current_student.id)
    @qwe =@student.subjects

    @master =@student.assestmentlists
     @ret = Masterlist.all

  end

  def selection
  	@student = Student.find(current_student.id)
  	@level = @student.level
    @blocks = Subject.where("level = ?", @level)
    @block=params[:subject][:block]
    @subjects = Subject.where("block = ? AND level = ?", @block, @level)

 

end

  def assestment

    
  end

def catcher

@student = Student.find(current_student.id)
    @level=@student.level
    


  respond_to do |format|
    @try="block = ? AND level = ?", params[:subjectblock], @level
    @ed = Subject.find(:all, :conditions =>@try)
         
      @ed.each do |subject|
      @kir=Assestmentlist.create
      @student.assestmentlists <<@kir 
      subject.assestmentlists << @kir 
      @kir.save
      format.html { redirect_to assestment_profile_path, notice: 'Subjects are succesfully added.' }
      end
    
  end

end



end





