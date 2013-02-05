Sfacs::Application.routes.draw do
  resources :administrators

  resources :miscellaneous

  resources :studinfos


  get "registration/register"
  post "registration/register"
  get "registration/catcher"
  post "registration/catcher"
   get "registration/roadblock"
  post "registration/roadblock"

  resources :constants

  get "billing/home"

  get "billing/studentcatcher"

  post "billing/studentcatcher"

  get "billing/viewassestment"
  post "billing/viewassestment"

  get "billing/viewtransaction"

  get "billing/assestmentcatcher"
  post "billing/assestmentcatcher"

  get "billing/paymentcatcher"
  post "billing/paymentcatcher"

  get "billing/paytuition"
  post "billing/paytuition"

  get "billing/enrollmentcatcher"
  post "billing/enrollmentcatcher"

  get "billing/viewregform"
  post "billing/viewregform"
   get "billing/printregform"
  post "billing/printregform"
   get "billing/printreceipt"
  post "billing/printreceipt"

  get "billing/viewenrollmentreceipt"

  get "billing/viewpaymentreceipt"
  post "billing/viewpaymentreceipt"

  resources :cashiers

  get "assestmentprocess/profile"
  post "assestmentprocess/profile"

  get "assestmentprocess/grades"
  post "assestmentprocess/grades"

  get "assestmentprocess/assestmentlist"
  post "assestmentprocess/assestmentlist"




  get "assestmentprocess/selection"
  post "assestmentprocess/selection"

  get "assestmentprocess/assestment"
  post "assestmentprocess/assestment"

  get "assestmentprocess/view"
  post "assestmentprocess/view"


  get "assestmentprocess/payments"
  post "assestmentprocess/payments"

  get "grades/home"
  post "grades/home"

 get "grades/gradingsystem"
  post "grades/gradingsystem"
  get "grades/catcher"
  post "grades/catcher"

   get "grades/catcher2"
  post "grades/catcher2"

  get "grades/viewlist"
  post "grades/viewlist"

  get "assestment/catcher"
  post "assestment/catcher"

  get "assestment/profile"

  post "assestment/profile"

  get "assestment/selection"

  get "assestment/assestment"
  post "assestment/assestment"



  get "admin/home"
  post "admin/home"
  get "admin/schoolyearcatcher"
  post"admin/schoolyearcatcher"

  
    get "admin/view"
  post "admin/view"
   get "admin/tview"
  post "admin/tview"
  get "admin/sview"
  post "admin/sview"
  get "admin/saview"
  post "admin/saview"
  get "admin/seview"
  post "admin/seview"

  get "admin/tclassview"
  post "admin/tclassview"
  get "admin/viewsassestment"
  post "admin/viewsassestment"
  get "admin/viewenrolled"
  post "admin/viewenrolled"
  post "admin/studcatcher"
  post "admin/teachercatcher"
  post "admin/subcatcher"
   post "admin/paymentcatcher"

  resources :subjects

  resources :teachers

  resources :students  
  
   resources :student_sessions, :teacher_sessions, :cashier_sessions
  match 'login' => 'student_sessions#new', :as => :login
  match 'logout' => 'student_sessions#destroy', :as => :logout
  match 'profile' => 'assestmentprocess#profile', :as => :profile
  match 'profilegrades' => 'assestmentprocess#grades', :as => :profilegrades
  match 'profileassestmentlist' => 'assestmentprocess#assestmentlist', :as => :profileassetmentlist
  match 'profilepayments' => 'assestmentprocess#payments', :as => :profilepayments

  match 'selection' => 'assestmentprocess#selection', :as => :selection
  match 'teacherlogin' => 'teacher_sessions#new', :as => :teacherlogin
  match 'teacherlogout' => 'teacher_sessions#destroy', :as => :teacherlogout
  match 'clogin' => 'cashier_sessions#new', :as => :clogin
  match 'clogout' => 'cashier_sessions#destroy', :as => :clogout
match 'grades' => 'grades#home', :as => :grades
match 'alogin' => 'administrator_sessions#new', :as => :alogin
  match 'alogout' => 'administrator_sessions#destroy', :as => :alogout

match 'view' => 'assestmentprocess#view', :as => :view
match 'home' => 'billing#home', :as => :home
  # The priority is based upon order of creation:

  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'student_sessions#new'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
