class TripsController < ProtectedController
  before_action :set_trip, only: [:show, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all

    render json: @trips
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    render json: @trip
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)

    @trip.user_id = current_user.id

    if @trip.save
      render json: @trip, status: :created, location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])

    if (@trip.user_id == current_user.id)

      if @trip.update(trip_params)
        head :no_content
      else
        render json: @trip.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    if (@trip.user_id == current_user.id)
      @trip.destroy
      head :no_content
    end
  end

  private

    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:flight_id)
    end
end
