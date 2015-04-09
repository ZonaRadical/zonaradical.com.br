class Manage::Tours::ParticipantsController < ApplicationController
  load_and_authorize_resource :tour, through: :current_user
  load_and_authorize_resource :participant, through: :tour, class: Tour::Participant

  def index
    load_participants
  end

  def approve
    load_participant
    @participant.approve
    redirect_to manage_tour_participants_path(@tour)
  end

  def refuse
    load_participant
    @participant.refuse
    redirect_to manage_tour_participants_path(@tour)
  end

  def show
    load_participant
  end

  def new
    build_participant
  end

  def edit
    load_participant
    build_participant
  end

  def create
    build_participant
    save_participant or render 'new'
  end

  def update
    load_participant
    build_participant
    save_participant or render 'edit'
  end

  def destroy
    load_participant
    @participant.destroy
    redirect_to tour_participants_url
  end

  private

  def load_participants
    @participants ||= participant_scope.to_a
  end

  def load_participant
    id = params[:id] || params[:participant_id]
    @participant ||= participant_scope.find(id)
  end

  def build_participant
    @participant ||= participant_scope.build
    @participant.attributes = participant_params
  end

  def save_participant
    redirect_to [@tour, @participant] if @participant.save
  end

  def participant_params
    participant_params = params[:participant]
    participant_params ? participant_params.permit(:tour_id, :user_id) : {}
  end

  def participant_scope
    @tour.participants
  end
end
