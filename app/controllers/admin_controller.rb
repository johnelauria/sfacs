class AdminController < ApplicationController
  before_filter :require_administrator
   def require_administrator
      unless current_administrator
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        return false
      end
    end
  def view
    @student=Student.find(params[:student])
    @transactions =@student.transactions

  end
  def viewsassestment
    
    @student=Student.find(params[:student])
    @ass=@student.assestmentlists.where("sy= ?",params[:ass])

  end
  def viewenrolled
    @syc=params[:ass]
    @student=Student.find(params[:student])
    @list=Masterlist.where("student_id = ? AND sy = ?",@student,@syc)
  end
  def tclassview
    @teacher=Teacher.find(params[:teacher])
    @subjects =@teacher.subjects
    @subject=Subject.find(params[:subject])
    @masterlist=@subject.masterlists
  end
  def tview
    @teacher=Teacher.find(params[:teacher])
    @subjects =@teacher.subjects
  end

  def sview
    @subjects=Subject.where("level=?",params[:level])
  end
def seview
  @subject=Subject.find(params[:subject])
      @teacher=Teacher.find(@subject.teacher_id)
      @subjectss=@subject.students
      @masterlist=@subject.masterlists
end
def saview
  @subject=Subject.find(params[:subject])
      @teacher=Teacher.find(@subject.teacher_id)
      @subjectss=@subject.students
      @masterlist=@subject.masterlists
end

  def home
    @s=Constant.find_by_name("sy")
             @a=Constant.find_by_name("assestmentperiod")
             @e=Constant.find_by_name("enrollmentperiod")
             @g=Constant.find_by_name("gradeencodingperiod")
    @status=Constant.find_by_name("status")
  	@time=Time.now
  	@syc=Constant.first
  	@constants=Constant.all
  	@log1 =Activitylog.last
  	@offset1=Activitylog.last
  	@offset=@offset1.id-30
  	@log=Activitylog.limit(30).offset(@offset)


if params[:duga]=="m" 
  	@student=Student.find(params[:student])
  	@transactions =@student.transactions


  	
  	@sy=@student.assestmentlists
  	
  	@sm=@student.masterlists
  	if params[:dugas]=="GAS"
      @ass=@student.assestmentlists.where("sy= ?",params[:assestmentlist][:sy])
      @list=Masterlist.where("student_id = ? AND sy = ?",@student,@syc.value)
     else
     	if params[:dugas]=="m"
     		@list=Masterlist.where("student_id = ? AND sy = ?",@student,@syc.value)
     		@ass=@student.assestmentlists.where("sy= ?",@syc.value)
     	else
     		if params[:dugas]=="GUM"
     		@list =Masterlist.where("student_id =? AND sy =?",@student, params[:masterlist][:sy])    
     		@ass=@student.assestmentlists.where("sy= ?",@syc.value)
 			else
 				@list=Masterlist.where("student_id = ? AND sy = ?",@student,@syc.value)
 				@ass=@student.assestmentlists.where("sy= ?",@syc.value)
 		end	
 	end
     end
       
     @list =@list.sort! { |a,b| a.subject.time1 <=> b.subject.time1 }
    else

    if params[:duga]=="t"
    @teacher=Teacher.find(params[:teacher])
    @subjects =@teacher.subjects
	
    if params[:dug]=="s"
    	@teacher=Teacher.find(params[:teacher])
    @subjects =@teacher.subjects
    @subject=Subject.find(params[:subject])
    @masterlist=@subject.masterlists
	end
	
end
    end

    if params[:select]=="yes"
    	@subjects=Subject.where("level=?",params[:level])
    end

    if params[:du]=="f"
      @subject=Subject.find(params[:subject])
      @teacher=Teacher.find(@subject.teacher_id)
      @subjectss=@subject.students
      @masterlist=@subject.masterlists
    end


if params[:d]=="r"
  @transaction=Transaction.find(params[:transaction])
  @payment=Payment.find(params[:payment])
  @transactions=@transaction.payments
  @subjects=@transaction.masterlists

end

  end


  def studcatcher
  	@studinfo=Studinfo.where("studnum=?",params[:stud])


if @studinfo.exists?

  	@student= Student.find_by_studinfo_id(@studinfo)
respond_to do |format|
             format.html {redirect_to admin_home_path(:duga=>"m",:student=>@student,:anchor=>"c1"), notice: 'Hey Hey.'}
             end
           else
respond_to do |format|
             format.html {redirect_to admin_home_path(:anchor=>"c1"), notice: 'Incorrect Student Number.'}
             end

  end
end


def teachercatcher
 
	@teacher=Teacher.find(params[:subject][:teacher_id])
	respond_to do |format|
             format.html {redirect_to admin_home_path(:duga=>"t",:teacher=>@teacher,:anchor=>"c3"), notice: 'Hey Hey.'}
             end


end
def paymentcatcher
  @payment=Payment.where("id=?",params[:payment])
  if @payment.exists?
  @payment=Payment.find(params[:payment])
  @transaction=@payment.transaction
  respond_to do |format|
             format.html {redirect_to admin_home_path(:d=>"r",:transaction=>@transaction,:payment=>@payment,:anchor=>"c5"), notice: 'Hey Hey.'}
             end
           else
             respond_to do |format|
             format.html {redirect_to admin_home_path(:anchor=>"c5"), notice: 'Invalid Reciept Id.'}
             end
          end

end







def schoolyearcatcher
  respond_to do |format|

             @status=Constant.find_by_name("status")
             @sy=Constant.find_by_name("sy")
             @ass=Constant.find_by_name("assestmentperiod")
             @enroll=Constant.find_by_name("enrollmentperiod")
             @grade=Constant.find_by_name("gradeencodingperiod")
             if params[:s]=="start"

             @status.value="SCHOOL YEAR STARTED"
             @status.save

             @sy.value= @sy.value.to_i+101
             @ass.value="yes"
             @enroll.value="yes"
             @grade.value="no"
             @sy.save
             @ass.save
             @enroll.save
             @grade.save






@students=Student.all
@syc =Constant.find_by_name("sy")



@students.each do |f|

@abc=f.masterlists.where("sy= ?",@syc.value)


if @abc.count == 0
  
  @abc.each do |t|
  @grade=Grade.find(t.grade_id)
  @grades=(@grade.first_quarter+@grade.second_quarter+@grade.third_quarter+@grade.fourth_quarter)/4
      if @grades<75
          @failmeter="yes"
      end
  end

  if @failmeter!="yes"
      @trans=f.transactions
      @trans.each do |b|  
        if b.paidamount!=b.subjectamount+b.miscamount
        @balance="yes"
        end
    end
  if @balance!="yes"

level= case f.studinfo.level
  when "N"    then puts "K"
  when "K"    then puts "P"
  when "P"    then puts "1"
  when "1"    then puts "2"
  when "2"    then puts "3"
  when "3"    then puts "4"
  when "4"    then puts "5"
  when "5"    then puts "6"
  when "6"    then puts "6"
 end
 f.studinfo.level=level

 f.studinfo.level.save

end
end
end
end
























             else
                if params[:s]=="finish"
                 @status.value="SCHOOL YEAR FINISHED"
                 @status.save
               else
                    if params[:s]=="sa"
                    @ass.value="yes"
                    @ass.save
                    else
                        if params[:s]=="sta"
                           @ass.value="no"
                           @ass.save
                         else
                            if params[:s]=="se"
                                @enroll.value="yes"
                                @enroll.save
                            else
                              if params[:s]=="ste"
                                  @enroll.value="no"
                                   @enroll.save
                             else
                                  if params[:s]=="sg"
                                    @grade.value="yes"
                                     @grade.save
                                  else
                                     if params[:s]=="stg"
                                        @grade.value="no"
                                       @grade.save
                                     else
                                          if params[:s]=="summer"
                                             @status.value="SUMMER PERIOD HAS STARTED"
                                             @status.save
                                             @grade.value="yes"
                                             @grade.save
                                             @enroll.value="yes"
                                             @enroll.save
                                             @ass.value="yes"
                                             @ass.save                                          
                                            end

                                     end
                                   end
                              end
                            end
                        end
                    end
                end
             end
             format.html {redirect_to admin_home_path(:anchor=>"c2"), notice: 'HEHEHE'}
             end
end








end
