class FlightsController < ProtectedController
  before_action :set_flight, only: [:show, :update, :destroy]

  # GET /flights
  # GET /flights.json
  def index
    @flights = Flight.all

    render json: @flights
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
    render json: @flight
  end

  # POST /flights
  # POST /flights.json

  # def creatflight
  #   flight = current_user.flights.create(flight_info)
  #   if flight.valid?
  #     render json: flight, status: :created
  #   else
  #     head :bad_request
  #   end
  # end

  def create
    @flight = Flight.new(flight_params)

    current_user.flights << @flight

    if @flight.save
      render json: @flight, status: :created, location: @flight
    else
      render json: @flight.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /flights/1
  # PATCH/PUT /flights/1.json
def update
  users_flight = @flight.trips.find_by(user_id: current_user.id)
  if users_flight == @flight && @flight.update(flight_params)
    head :no_content
  else
    render json: @flight.errors, status: :unprocessable_entity
  end
end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight.destroy

    head :no_content
  end

  private

    def set_flight
      @flight = Flight.find(params[:id])
    end

    def flight_params
      params.require(:flights)
            .permit(:flight_number, :departure_date, :departure_time, :departure, :arrival_date, :arrival_time, :arrival, :arrival_zipcode, :gate, :terminal)
    end
end
