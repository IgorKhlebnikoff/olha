class ProfilesController < ApplicationController
  skip_before_filter :check_profile, only: [:edit, :update]
  before_filter :find_profile

  def show
    @code = Country.find_country_by_alpha2(@profile.country).country_code
    @country = Carmen::Country.coded(@profile.country).name
  end

  def update
    @profile.update_attributes(profile_params)
    if @profile.save
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def find_profile
    @profile = Profile.find_by_user_id(current_user)
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone_number, :gender, :user_id, :country)
  end
end
