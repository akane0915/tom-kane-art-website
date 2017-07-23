class AdminsController < ApplicationController
  before_action do
    redirect_to new_admin_session_path unless current_admin.try(:super_admin)
  end

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = "Your admin has been saved."
      redirect_to admins_path
    else
      render :new
    end
  end

  def destroy
    Admin.find(params[:id]).destroy
    flash[:notice] = "The admin has been deleted."
    redirect_to admins_path
  end

private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

end
