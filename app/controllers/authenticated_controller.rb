class AuthenticatedController < ApplicationController
  before_action :authenticate_user!
  layout :application_authenticated
  before_action :set_profile

  def set_profile
    @profile = current_user.profile
  end

  def application_authenticated
    "application_authenticated"
  end
end
