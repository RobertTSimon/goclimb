class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :destroy, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @route = Route.new
    authorize @route
    # @route_attachment = @route.route_attachments.build
  end

  def create
    @route = Route.new(route_params)
    if route.save
      redirect route_path(@route)
    else
      render :new
    end
  end

  def index
    @routes = policy_scope(Route).order(created_at: :desc)
    @routes_marked = Route.where.not(latitude: nil, longitude: nil)

    @markers = @routes_marked.map do |route_marked|
      {
        lat: route_marked.latitude,
        lng: route_marked.longitude
      }
    end
  end


  def show
    set_route
    unless (@route.latitude.nil? || @route.longitude.nil?)
       @markers = [{lat: @route.latitude, lng: @route.longitude}]
    end
    authorize @route
  end

  def destroy
    set_route
    authorize @route
  end

  def edit
    authorize @route
  end

  def update
    authorize @route
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    route.permit(:route).require(:name, :longitude, :latitude, :description, :type, :style, :level, :rating)
  end
end

# class EquipmentController < ApplicationController
#   before_action :set_equipment, only: [:show, :edit, :destroy, :update]
#   skip_before_action :authenticate_user!, only: [:index, :show]

#   def index
#       @routes = policy_scope(route).order(created_at: :desc)
#     # @route = route.all
#     if params[:query].present?
#       @route = route.global_search(params[:query])
#     elsif params[:sport]
#       @route = route.where(sport: params[:sport])
#     else
#       # Show nothing
#       # @route = []
#       # Show all
#       @route = route.all
#     end

#     if user_signed_in?
#       @route = @route.reject do |route|
#         route.user.username == current_user.username
#       end
#     end
#   end


#   def show
#     authorize @route
#     @marker = {
#       lat: @route.latitude,
#       lng: @route.longitude,
#       # infoWindow: render_to_string(partial: "infowindow", locals: { route: @route })
#       image_url: helpers.asset_url('rond.png')
#       }
#     @booking = Booking.new
#     @review = Review.new(route: @route)
#   end

#   def create
#     @route = route.new(route_allowed_params)
#     authorize @route
#     @route.user = current_user

#     if !params[:route_attachments].nil?
#       params[:route_attachments]['photo'].each do |a|
#          @route.route_attachments.new(:photo => a)
#       end
#     end

#     if @route.save
#       redirect_to route_path(@route), notice: "Listing was successfully created!"
#     else
#       render :new
#     end

#   end

#   def edit
#    authorize @route
#   end

#   def update
#     if @route.update(route_allowed_params)
#       if !params[:route_attachments].nil?
#         params[:route_attachments]['photo'].each do |a|
#           @route_attachment = @route.route_attachments.create!(:photo => a, :route_id => @route.id)
#         end
#       end
#       redirect_to route_path(@route), notice: "Listing was successfully updated!"
#     else
#       render :edit
#     end
#     authorize @route
#   end

#   def destroy
#     @route.destroy
#     redirect_to route_index_path, notice: "Listing was successfully destroyed!"
#     authorize @route
#   end

#   private


#   def route_allowed_params
#     params.require(:route).permit(:name, :sport, :description, :address, :price, equipment_attachments_attributes: [:id, :equipment_id, :photo])
#   end
# end
