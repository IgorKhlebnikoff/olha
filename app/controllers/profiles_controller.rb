class ProfilesController < ApplicationController
  skip_before_filter :check_profile, only: [:edit, :update]
  before_filter :find_profile

  def edit
  end

  def update
    @profile.update_attributes(params[:profile])
    if @profile.save
      redirect_to edit_profile_path, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def find_profile
    @profile = Profile.find_by_user_id(current_user)
  end
end
