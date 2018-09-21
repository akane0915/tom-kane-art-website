class DefaultConfigurationsController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @config = DefaultConfiguration.first
  end

  def update
    @config = DefaultConfiguration.first
    if @config.update(default_configuration_params)
      @config.save
      flash[:notice] = "Config was successfully updated."
      redirect_to paintings_path
    else
      render "_form"
    end
  end

private

  def default_configuration_params
    params.require(:default_configuration).permit(:shipping_fee)
  end
end