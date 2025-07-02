class ProfilesController < ApplicationController
   include Authentication

   def new
     @session = Current.session
     @user = @session.user
     redirect_to edit_profile_path(@user.profile) if @user.profile
     @profile = @user.build_profile
   end
  def create
    @user = Current.session.user
    @profile = @user.build_profile(profile_params)
    if @profile.save
      redirect_to root_path, notice: "Profile add successfully."
    else
      flash[:alert] = "There was an error submitting your Profile."
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @user = Current.session.user
    @profile = @user.profile
  end

  def update
    @user = Current.session.user
    @profile = @user.profile
    if @profile.update(profile_params)
      redirect_to root_path, notice: "Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
      flash[:alert] = "There was an error updating your profile."
    end
  end
  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  private

  def profile_params
    params.require(:profile).permit(:employee_name, :department, :job_title, :phone_number, :city, :father_name, :mother_name, :acount_number)
  end
end
