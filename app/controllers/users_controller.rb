#
class UsersController < ProtectedController
  skip_before_action :authenticate, only: [:signup, :signin]

  # POST '/sign-up'
  def signup
    user = User.create(user_creds)
    if user.valid?
      render json: user, status: :created
    else
      head :bad_request
    end
  end

  # POST '/sign-in'
  def signin
    creds = user_creds
    if (user = User.authenticate creds[:email],
                                 creds[:password])
      render json: user, serializer: UserLoginSerializer, root: 'user'
    else
      head :unauthorized
    end
  end

  # DELETE '/sign-out/1'
  def signout
    if current_user == User.find(params[:id])
      current_user.logout
      head :no_content
    else
      head :unauthorized
    end
  end

  # PATCH '/change-password/:id'
  def changepw
    if !current_user.authenticate(pw_creds[:old]) ||
       (current_user.password = pw_creds[:new]).blank? ||
       !current_user.save
      head :bad_request
    else
      head :no_content
    end
  end

  def index
    render json: User.all
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    head :bad_request
  end

  # def creatflight
  #   flight = current_user.flights.create(flight_info)
  #   if flight.valid?
  #     render json: flight, status: :created
  #   else
  #     head :bad_request
  #   end
  # end

  # def updateflight
  #   flight = current_user.flights.find(flight_info[:flight_number])
  #   if flight.update(flight_info)
  #     head :no_content
  #   else
  #     render json: @flight.errors, status: :unprocessable_entity
  #   end
  # end

  private

  def user_creds
    params.require(:credentials)
          .permit(:email, :password, :password_confirmation)
  end

  def pw_creds
    params.require(:passwords)
          .permit(:old, :new)
  end

  def flight_info
    params.require(:flights)
          .permit(:flight_number, :departure_date, :departure_time, :departure, :arrival_date, :arrival_time, :arrival, :arrival_zipcode, :gate, :terminal)
  end


  # private :user_creds, :pw_creds, :flight_info
end
