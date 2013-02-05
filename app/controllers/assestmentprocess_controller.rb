class AssestmentprocessController < ApplicationController
before_filter :require_student
   def require_student
      unless current_student
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        return false
      end
    end

  def profile
    @syc=Constant.first
  	@student = Student.find(current_student.id)
    if @student.transactions.count != 0
    @qwe =@student.subjects
    @master =@student.assestmentlists
     @ret = Masterlist.all
     @syc=Constant.find_by_name("sy")
     @list = Masterlist.where("student_id = ? AND sy = ?", @student, @syc.value)
     @transactions =@student.transactions.where("sy= ?",@syc.value)
     if @transactions.exists?
       @payments2 =Transaction.find(@transactions)
       @paymentslist =@payments2.payments
     else
      @transactions=@student.transactions.where("sy= ?","1112")
    end
     else
      
    end

  end

def grades
  @student = Student.find(current_student.id)
    @qwe =@student.subjects
    @master =@student.assestmentlists
     @ret = Masterlist.all
     @syc=Constant.first
     @sy=Masterlist.where("student_id = ?",@student)
     if params[:dugas]=="gago"
     @listo=Masterlist.where("student_id = ? AND sy = ?",@student,@syc.value)
     if @listo.count == 0
        @lis=Masterlist.where("student_id = ?",@student)
        @lis.each do |g|
          @scy=g.sy
        end
        @scy
        @list=Masterlist.where("student_id = ? AND sy = ?",@student,@scy)
      else
      @list=Masterlist.where("student_id = ? AND sy = ?",@student,@syc.value)


        end


   else
      @list =Masterlist.where("student_id =? AND sy =?",@student, params[:masterlist][:sy])
   end 

     @list =@list.sort! { |a,b| a.subject.time1 <=> b.subject.time1 }
     @transactions =@student.transactions
      


end
def assestmentlist
  @student = Student.find(current_student.id)
    @qwe =@student.subjects
    @master =@student.assestmentlists
    if params[:dugas]=="gago"

     @syc=Constant.first     
     @syo=@student.assestmentlists.where("sy= ?",@syc.value)
     @block=@syc.value
     if @syo.count == 0
        @sy=@student.assestmentlists
        @sy.each do |g|
          @scy=g.sy
        end
        
        @sy=@student.assestmentlists.where("sy= ?",@scy)
        @block=@scy
      else
      @sy=@student.assestmentlists.where("sy= ?",@syc.value)
      @block=@syc.value

        end

     else
           
     @sy=@student.assestmentlists.where("sy= ?",params[:assestmentlist][:sy])
      @block=params[:assestmentlist][:sy]
   end
      
end

def payments
  @student = Student.find(current_student.id)
    @syc=Constant.first
    @transactions =@student.transactions
    





end
  def selection
  	@student = Student.find(current_student.id)
  	@level = @student.studinfo.level
    @summer= Constant.find_by_name("summerperiod")
    if @summer !="summerperiod"
    @blocks = Subject.where("level = ? AND block != ?", @level,"summer")
    else
       @blocks = Subject.where("level = ? AND block = ?", @level,"summer")
    end
    @block=params[:subject][:block]
    @subjects = Subject.where("block = ? AND level = ?", @block, @level)
  end

  def assestment
    @period=Constant.find_by_name("assestmentperiod")
    @syc=Constant.find_by_name("sy")
    #assestment period
    if @period.value == "yes"
      
      @student = Student.find(current_student.id)
    if Transaction.find_by_student_id(current_student.id) != nil
      #old student

      @student_transactions=@student.transactions
      @student_transactions.each do |t|
        @total=t.subjectamount+t.miscamount
          if @total != t.paidamount
            @pret="NOPE"
          end

      end
      
      if @pret =="NOPE"
        #if student has existing balance
        respond_to do |format|
        format.html {redirect_to :profile, notice: 'bayad muna pre!!.'}
        end
     
      else
        #if student have good balance
        @tar=@student.masterlists
        @failmeter="pass"
        @tar.each do |ta|
        grade=(ta.grade.first_quarter+ta.grade.second_quarter+ta.grade.third_quarter+ta.grade.fourth_quarter)/4
          if grade < 75 
            @remarks="failed"
            @failmeter="fail" 
          else
            @remarks="passed"
          end          

        end

        if @failmeter == "fail"
          #have failing grades
           respond_to do |format|
             format.html {redirect_to assestmentprocess_grades_path(:dugas=>"gago"), notice: 'bagsak ka pre!!.'}
             end

        else
        
        @abc=@student.masterlists.where("sy= ?",@syc.value)
        
        if @abc.count != 0
        #if already have enrollmentlist for sy
        respond_to do |format|
             format.html {redirect_to assestmentprocess_grades_path(:dugas=>"gago"), notice: 'You are already enrolled!!.'}
             end

        else

        @level=@student.studinfo.level
  
    
        @try="block = ? AND level = ?", params[:q], @level
        @try2="level =?", @level
        @ed = Subject.find(:all, :conditions =>@try)
        @syc=Constant.first
        @list=@student.assestmentlists.where("sy = ?", @level)

    


         respond_to do |format|
            @list=@student.assestmentlists.where("sy = ?",@syc.value)
            @list.each do |subject|
              @tubject=Subject.find(subject.subject_id)
              Activitylog.create(user: "Student",userid: @student.id, :activity=> "removes a subject(id: "+@tubject.id.to_s+" description: "+@tubject.description.to_s+" block: "+@tubject.block.to_s+" level: "+@tubject.level.to_s+")in his assestmentlist for the sy: "+@syc.value.to_s)  
              subject.delete
            end            
      @ed.each do |subject|
        @kir=Assestmentlist.create(sy: @syc.value)
        @tubject=Subject.find(subject.id)
        @student.assestmentlists <<@kir 
        @tubject.assestmentlists << @kir 
        @kir.save
        Activitylog.create(user: "Student",userid: @student.id, :activity=> "adds a subject(id: "+@tubject.id.to_s+" description: "+@tubject.description.to_s+" block: "+@tubject.block.to_s+" level: "+@tubject.level.to_s+")in his assestmentlist for the sy: "+@syc.value.to_s)  
      end
      format.html {redirect_to assestmentprocess_view_path, notice: 'Subjects are succesfully added.'} 
    end
  end
  end

    end



    else
      #for new students
       
        @abc=Masterlist.where("student_id = ? AND sy= ?",current_student.id,@syc.value)
        
        if @abc == nil
        #if already have enrolled subj for sy
        respond_to do |format|
             format.html {redirect_to :profilegrades, notice: 'You are already enrolled for this Schoolasd Year!!.'}
             end

        else


    @level=@student.studinfo.level
  
    
    @try="block = ? AND level = ?", params[:q], @level
    @try2="level =?", @level
    @ed = Subject.find(:all, :conditions =>@try)
    @syc=Constant.first
    @list=@student.assestmentlists.where("sy = ?", @level)

    


    respond_to do |format|
      @list=@student.assestmentlists.where("sy = ?",@syc.value)
      @list.each do |subject|
        @tubject=Subject.find(subject.subject_id)
        Activitylog.create(user: "Student",userid: @student.id, :activity=> "removes a subject(id: "+@tubject.id.to_s+" description: "+@tubject.description.to_s+" block: "+@tubject.block.to_s+" level: "+@tubject.level.to_s+")in his assestmentlist for the sy: "+@syc.value.to_s)  

        subject.delete
        
        end            
 @ed.each do |subject|
      @kir=Assestmentlist.create(sy: @syc.value)
      @tubject=Subject.find(subject.id)
      @student.assestmentlists <<@kir 
      @tubject.assestmentlists << @kir 
      @kir.save
      Activitylog.create(user: "Student",userid: @student.id, :activity=> "adds a subject(id: "+@tubject.id.to_s+" description: "+@tubject.description.to_s+" block: "+@tubject.block.to_s+" level: "+@tubject.level.to_s+")in his assestmentlist for the sy: "+@syc.value.to_s)  

    end
     format.html {redirect_to assestmentprocess_view_path, notice: 'Subjects are succesfully added.'} 
    end
  end

      #for else
    end



  	

  else
  respond_to do |format|
  format.html {redirect_to assestmentprocess_profile_path, notice: 'ENROLLMENT PERIOD IS OVER.'}
   end
  end

  end

  def view
    @student = Student.find(current_student.id)
    @syc=Constant.first  
    @view=@student.assestmentlists.where("sy= ?",@syc.value)
    @m=Miscellaneou.all




  	
  end

end
