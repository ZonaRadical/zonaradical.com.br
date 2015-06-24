class Tours::ParticipantsController < ApplicationController
  include ToursHelper

  load_resource :tour
  load_and_authorize_resource :participant, through: :tour, class: Tour::Participant

  def create
    build_participant
    save_participant or redirect_to tours_path, notice: 'Não foi possível completar a operação.'
  end

  def recall
    url = manage_tour_participants_url(@tour)
    last_recall = @tour.owners.first.user.notifications.where(
      body: notification_body
    ).first
    if last_recall.nil? || last_recall.created_at < 1.day.ago
      @tour.owners.first.user.notify(
        "Solicitação para participação em tour", notification_body
      )
    end
    redirect_to show_tour_tours_path(country_or_resort(@tour), @tour), notice: 'Seu recall foi enviado, aguarde uma resposta.'
  end

  private

  def build_participant
    @participant ||= participant_scope.build
    @participant.attributes = participant_params
  end

  def save_participant
    if @participant.save
      @tour.owners.first.user.notify(
        "Solicitação para participação em tour", notification_body
      )
      redirect_to show_tour_tours_path(country_or_resort(@tour), @tour), notice: 'Seu pedido foi enviado, em breve você receberá uma resposta.'
    end
  end

  def participant_params
    participant_params = params[:participant]
    participant_params ? participant_params.permit(:tour_id, :user_id) : {}
  end

  def participant_scope
    @tour.participants
  end

  def notification_body
    url = manage_tour_participants_url(@tour)
    "O usuário '#{current_user.name}' gostaria de participar no seu Trip '#{@tour.title}'. " +
    "#{view_context.link_to "Avalia este pedido aqui", url}."
  end
end
