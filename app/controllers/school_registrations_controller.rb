class SchoolRegistrationsController < ApplicationController
  
  def new
    @register = SchoolRegistration.new
  end
  
  def create
    @register = SchoolRegistration.new(register_params)
    
    if @register.save
      flash[:success] = "Congratulations!  You registered your school for ReachMe!  School Counselors may sign up and have your students sign up!"
      redirect_to root_path
      
    else
      flash[:danger] = @register.errors.full_messages.join(", ")
      redirect_to new_registration_path
    end
  end
  
  private
    def register_params
      params.require(:school_registration).permit(:name_of_person_completing_form, :role_in_school, :school_name, :grade_levels, :street_name, :city, :state, :zip_code)
    end
end