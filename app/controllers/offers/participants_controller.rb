class Offers::ParticipantsController < ApplicationController
  load_resource :offer
  load_and_authorize_resource :participant, through: :offer, class: Offer::Participant

  def create
    build_participant
    save_participant or redirect_to offers_path, notice: 'Não foi possível completar a operação.'
  end

  private

  def build_participant
    @participant ||= participant_scope.build
    @participant.attributes = participant_params
  end

  def save_participant
    if @participant.save
      url = manage_offer_participants_url(@offer)
      @offer.owners.first.user.notify("Solicitação para participação em offer",
        "O usuário '#{current_user.name}' gostaria de participar da offer '#{@offer.title}'.
         Para avaliar este pedido acesse #{view_context.link_to url, url}.")
      redirect_to offer_path(@offer), notice: 'Seu pedido foi enviado, em breve você receberá uma resposta.'
    end
  end

  def participant_params
    participant_params = params[:participant]
    participant_params ? participant_params.permit(:offer_id, :user_id) : {}
  end

  def participant_scope
    @offer.participants
  end
end