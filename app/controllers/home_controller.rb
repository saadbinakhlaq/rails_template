class HomeController < AuthenticatedController
  def index
    if current_user.profile.nil?
      redirect_to new_profile_path
    end
  end
end
