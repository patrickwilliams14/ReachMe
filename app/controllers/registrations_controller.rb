class RegistrationsController < ApplicationController
  
  def new
<<<<<<< HEAD
    @register = Registration.new
=======
   
>>>>>>> user_memberships
  end
  
  def create
    @register = Registration.new(register_params)
    
    if @register.save
      flash[:success] = "Congratulations!  You registered your school for ReachMe!" <br> "School Counselors may sign up and have your students sign up!"
      redirect_to root_path
    end
  end
  
  private
  # To collect data from form, we need to use
  # Strong parameters and whitelist the form fields - started in rails 4 - security feature
    def register_params
      params.require(:register).permit(:school_district_name, :street_name, 
                                      :city, :state, :zip_code)
    end
  
  
end