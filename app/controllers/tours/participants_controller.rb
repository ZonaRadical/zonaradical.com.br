class Tours::ParticipantsController < ApplicationController
  load_resource :tour
  load_and_authorize_resource :participant, through: :tour, class: Tour::Participant

  def create
    build_participant
    save_participant or redirect_to tours_path, notice: 'Não foi possível completar a operação.'
  end

  private

  def build_participant
    @participant ||= participant_scope.build
    @participant.attributes = participant_params
  end

  def save_participant
    redirect_to tours_path, notice: 'Seu pedido foi enviado, em breve você receberá uma resposta.' if @participant.save
  end

  def participant_params
    participant_params = params[:participant]
    participant_params ? participant_params.permit(:tour_id, :user_id) : {}
  end

  def participant_scope
    @tour.participants
  end
end