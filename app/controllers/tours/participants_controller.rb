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
    if @participant.save
      url = manage_tour_participants_url(@tour)
      @tour.owners.first.user.notify("Solicitação para participação em tour",
        "O usuário '#{current_user.name}' gostaria de participar da tour '#{@tour.title}'.
         Para avaliar este pedido acesse #{view_context.link_to url, url}.")
      redirect_to tours_path, notice: 'Seu pedido foi enviado, em breve você receberá uma resposta.'
    end
  end

  def participant_params
    participant_params = params[:participant]
    participant_params ? participant_params.permit(:tour_id, :user_id) : {}
  end

  def participant_scope
    @tour.participants
  end
end