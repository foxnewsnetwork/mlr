module Negotiations
  class Controller < ::ApplicationController
    respond_to :js, :json, :html
    expose(:negotiation) { Negotiations.on_listing_from_buyer params[:listing_id], params[:buyer_id] }
    expose(:discussion) { Negotiations.find_from_listing_and_buyer params[:listing_id], params[:buyer_id] }
    def create
      respond_with negotiation
    end

    def reply_message
      respond_with discussion.message_from(params[:message][:content], params[:message][:speaker_id])
    end

    def counter_offer
      respond_with discussion.offer_from(params[:offer][:price], params[:offer][:speaker_id])
    end

    def accept_offer
      respond_with discussion.accept_offer params[:offer][:id], params[:offer][:speaker_id]
    end

    def decline_offer
      respond_with discussion.decline_offer params[:offer][:id], params[:offer][:speaker_id]
    end

  end
end