class ProfilesController < ApplicationController
   include Authentication
  def index
  end
  def new
     @session = Current.session
     @user = @session.user
     @profile = @user.profile
  end
  def create
    @session = Current.session
    @user = @session.user

    @profile = @user.profile.new(profile_params)

    if @profile.save
      redirect_to root_path, notice: "Profile add successfully."
    else
      flash[:alert] = "There was an error submitting your Profile."
      redirect_to root_path # Or re-render index if needed
    end
  end

  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  private

  def leave_params
    params.require(:profile).permit(:employee_name, :department, :job_title, :phone_number, :city, :father_name, :mother_name, :account_number)
  end
end
