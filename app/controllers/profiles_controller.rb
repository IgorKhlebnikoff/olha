class ProfilesController < ApplicationController
  skip_before_filter :check_profile, only: [:show, :edit, :update]
  before_filter :find_profile

  def show
    @code = Country.find_country_by_alpha2(@profile.country).country_code
    @country = Carmen::Country.coded(@profile.country).name
  end

  def edit
  end

  def update
    @profile.update_attributes(params[:profile])
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
end
