class SignUpsController < ApplicationController
  before_action :set_sign_up, only: %i[ edit update destroy ]
  before_action :authenticate_user!

  # GET /sign_ups or /events.json
  def index
  end

  # GET /sign_ups/1 or /sign_ups/1.json
  def show
  end

  # GET /sign_ups/new
  def new
    @sign_up = SignUp.new
  end

  # GET /sign_ups/1/edit
  def edit
  end

  # POST /sign_ups or /sign_ups.json
  def create
    user_id = current_user.id 
    event = Event.find(params[:event_id])
    event_id = event.id
    @sign_up = SignUp.new(attendee_id: user_id, event_attended_id: event_id)
    respond_to do |format|
      if @sign_up.save
        format.html { redirect_to root_path, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @sign_up }
      else
        format.html { render root_path, status: :unprocessable_entity }
        format.json { render json: @sign_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sign_ups/1 or /sign_ups/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sign_ups/1 or /sign_ups/1.json
  def destroy
    SignUp.delete(@sign_up)
    respond_to do |format|
      format.html { redirect_to events_url, notice: "You have successfully unrsvp'd." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sign_up
      user_id = current_user.id 
      event = Event.find(params[:event_id])
      event_id = event.id
      @sign_up = SignUp.where(attendee_id: user_id, event_attended_id: event_id)
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:sign_up).permit(:event_id)
    end
end