class ProfilesController < AuthenticatedController
  def show
    if current_user.profile.nil?
      redirect_to new_profile_path
    else
      @profile = current_user.profile
    end
  end

  def new
    if current_user.profile.present?
      redirect_to profile_url(current_user.profile)
    else
      @profile = Profile.new
      @profile.build_address
    end
  end

  def create
    return if current_user.profile.present?

    @profile = current_user.create_profile(profile_creation_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_url, notice: "Profile succuessfully created" }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    @profile.update(profile_update_params)
    respond_to do |format|
      if @profile.errors.present?
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      else
        format.html { redirect_to profile_url, notice: "Profile succuessfully edited" }
        format.json { render :show, status: :ok, location: @profile }
      end
    end
  end

  private

  def profile_creation_params
    params.require(:profile).permit(
      :first_name,
      :last_name,
      :phone_number,
      address_attributes: [
        :street,
        :city,
        :country,
        :postal_code,
      ]
    )
  end

  def profile_update_params
    params.require(:profile).permit(
      :id,
      :first_name,
      :last_name,
      :phone_number,
      address_attributes: [
        :street,
        :city,
        :country,
        :postal_code,
        :id,
      ]
    )
  end
end
