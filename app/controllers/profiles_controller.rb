class ProfilesController < ApplicationController
  before_filter :get_profile, :only => [:show, :edit, :update]

  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(params[:profile])
    if @profile.save
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      render "new"
    end
  end

  def update
    if @profile.update_attributes(params[:profile])
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render "edit"
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to profiles_url 
  end
  
  def get_profile
    @profile = Profile.find(params[:id])
  end
end
