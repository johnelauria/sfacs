class BillingController < ApplicationController
 

  before_filter :require_cashier
   def require_cashier
      unless current_cashier
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :login
        return false
      end
    end


  def home
  
  end

  def studentcatcher  

 redirect_to billing_viewassestment_path
 end  

def viewassestment
  @period=Constant.find_by_name("enrollmentperiod")
  @b=params[:studid]
if @period.value == "yes"
        @syc=Constant.find_by_name("sy")
        @b=params[:studid]
        if params[:dugas] == "id"
          @studinfo=Studinfo.find_by_studnum(params[:studid])
           @student=Student.find_by_studinfo_id(@studinfo)
           if @student    

          if Assestmentlist.where("student_id = ? AND sy= ?",@student.id,@syc.value).count == 0
            respond_to do |format|
            format.html {redirect_to :home, notice: 'Assestment List Does Not Exist!!.'}
            end
          else
          @a=@student.assestmentlists.where("sy= ?",@syc.value)
          end
           else
            respond_to do |format|
            format.html {redirect_to :home, notice: 'student number does not exist.'}
            end
          end

        else
         @stud=Studinfo.where("fname = ? AND mname = ? AND lname = ?",params[:studfname],params[:studminitial],params[:studlname])
          if @stud.exists?
          @student=Student.find_by_studinfo_id(@stud)
          @b=@student.studinfo.studnum 
           if Assestmentlist.where("student_id = ? AND sy= ?",@student.id,@syc.value).count == 0
          respond_to do |format|
          format.html {redirect_to :home, notice: 'Assestment List Does Not Exist!!.'}
          end
           else
           @a=@student.assestmentlists.where("sy= ?",'1112')
           end
         else
          respond_to do |format|
          format.html {redirect_to :home, notice: 'asdasd List Does Not Exist!!.'}
          end
        end
      end


else
    respond_to do |format|
    format.html {redirect_to :home, notice: 'Enrollment Period is Over!.'}
    end
end

end

  def viewtransaction
  end

  def assestmentcatcher
    @period=Constant.find_by_name("enrollmentperiod")     
    if @period.value == "yes"
       @syc =Constant.find_by_name("sy")
     
      @student=Student.find(params[:studid])
    
      @a=@student.transactions.where("sy= ?",@syc.value)
      @t=params[:amount].to_i 
      @g=Transaction.find(@a)
      @f=@g.paidamount+@t
      @bal=(@g.subjectamount+@g.miscamount)-@g.paidamount
      if @bal>=@t
          @payment=Payment.create(:amount => params[:amount],:sy =>@syc.value,:cashier_id=>current_cashier.id)
          @transaction =Transaction.find(@a)
          @transaction.payments <<@payment
          @payment.save       
          @transaction.paidamount= @f
          @transaction.save
          @paymentslist =@transaction.payments

          respond_to do |format|
          format.html {redirect_to billing_viewpaymentreceipt_path(:pay=>@payment,:transaction=>@transaction), notice: 'Enrollment Period is Over!.'}
          end
      else
          respond_to do |format|
          format.html {redirect_to :home, notice: 'The Amouaasdasnt being Paid is Much higher than balance!.'}
          end
      end
    else
          respond_to do |format|
          format.html {redirect_to :home, notice: 'Enrollment Period is Over!.'}
          end
    end
    

  end

  def paymentcatcher
 @period=Constant.find_by_name("enrollmentperiod")
if @period.value == "yes"


    @syc=Constant.find_by_name("sy")
    @b=params[:studid]
    if params[:dugas] == "id"
        @studinfo=Studinfo.find_by_studnum(params[:studid])
           @student=Student.find_by_studinfo_id(@studinfo)   
     if Transaction.where("student_id = ? AND sy= ?",@student.id,@syc.value).count == 0
        respond_to do |format|
          format.html {redirect_to :home, notice: 'Student Has Not Yet Enrolled This School Year!!.'}
        end
      else
        @syc=Constant.find_by_name("sy")
           @studinfo=Studinfo.find_by_studnum(params[:studid])
           @student=Student.find_by_studinfo_id(@studinfo) 
      @a=@student.transactions.where("sy= ?",@syc.value)
      @payments2 =Transaction.find(@a)
      @payments =@payments2.payments
      end
      else
    @stud=Studinfo.where("fname = ? AND mname = ? AND lname = ?",params[:studfname],params[:studminitial],params[:studlname])
    @student=Student.find_by_studinfo_id(@stud)  

    if Transaction.where("student_id = ? AND sy= ?",@student.id,@syc.value).count == 0
      respond_to do |format|
       format.html {redirect_to :home, notice: 'Assestment List Does Not Exist!!.'}
      end
    else
       @a=@student.transactions.where("sy= ?",@syc.value)
       @payments2 =Transaction.find(@a)
       @payments =@payments2.payments
    end
    end
else
    respond_to do |format|
    format.html {redirect_to :home, notice: 'Enrollment Period is Over!.'}
    end

end


  end

  def paytuition
    @period=Constant.find_by_name("enrollmentperiod")
     
  if @period.value == "yes"
      @studinfo=Studinfo.find_by_studnum(params[:stud])
           @student=Student.find_by_studinfo_id(@studinfo)
    @syc =Constant.find_by_name("sy")
    @abc=@student.masterlists.where("sy= ?",@syc.value)
        
        if @abc.count != 0
        #if already have enrollmentlist for sy
        respond_to do |format|
             format.html {redirect_to :home, notice: 'You are already enrolled!!.'}
           end
           else
            @bat= @student.transactions
            if @bat.count == 0 
              m=Miscellaneou.sum("amount")
    @tra=Transaction.create(sy: "1112", subjectamount: params[:subjecttotal], miscamount: m)
    @student.transactions <<@tra
    @tra.save
    @b=@tra.id
     else    
    respond_to do |format|
    format.html {redirect_to :home, notice: 'Transaction for This Sy already exists.'}
    end

  end

  end
  else
    respond_to do |format|
    format.html {redirect_to :home, notice: 'ENROLLMENT PERIOD IS OVER!.'}
    end

  end

  end

  def enrollmentcatcher
    
    @period=Constant.find_by_name("enrollmentperiod")
    @tae = "yes"
        @transaction=Transaction.find(params[:trans])
    @stud=Student.find(@transaction.student_id)
     if @tae == "yes"
      @syc =Constant.find_by_name("sy")
      @abc=@stud.masterlists.where("sy= ?",@syc.value)

      if @abc.count == 0

        @syc =Constant.find_by_name("sy")
        @payment=Payment.create(:amount => params[:amount],:sy =>@syc.value,:cashier_id=>current_cashier.id)      
        @transaction.payments << @payment
        @payment.save
        @t=params[:amount].to_i  
        @transaction.paidamount=@t      
        @transaction.save
        @transfer=@transaction.student_id
        @student=Student.find(@transaction.student_id)
        @a=@student.assestmentlists.where("sy= ?",@syc.value)                
        @a.each do |subject|
        @kir=Masterlist.create(sy: @syc.value)
        @grade=Grade.create(first_quarter: 0,second_quarter: 0, third_quarter: 0, fourth_quarter: 0)
        @subject=Subject.find(subject.subject_id)
        @student.masterlists << @kir 
        @subject.masterlists << @kir
        @transaction.masterlists << @kir
        @grade.masterlists << @kir 
        @kir.save
        @to=@student.masterlists.where("sy= ?",@syc.value) 
        end
      else             
      respond_to do |format|
      format.html {redirect_to :home, notice: 'You are Already Enrolled!.'}
      end
      end 
    else
      respond_to do |format|
      format.html {redirect_to :home, notice: 'Enrollment Period is Over!.'}
      end
    end
      

  end

  def viewregform
     @syc =Constant.find_by_name("sy")
    @student=Student.find(params[:stud])
    @view=@student.masterlists.where("sy= ?",@syc.value) 
  end


  def viewenrollmentreceipt
  end

  def viewpaymentreceipt
    @payment=Payment.find(params[:pay])
    @transaction=Transaction.find(params[:transaction])
  

end
def printreceipt
    @payment=Payment.find(params[:pay])
    @transaction=Transaction.find(params[:transaction])
  
end
end