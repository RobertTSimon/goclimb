class SitesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @sites = Site.find(params[:id])
    authorize @sites
  end
end
