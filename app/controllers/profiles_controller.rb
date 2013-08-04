class ProfilesController < ApplicationController
  def edit
    @profile = Profile.find_by_user_id(current_user)
  end
end
