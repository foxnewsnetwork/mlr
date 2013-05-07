module Negotiations
  class Controller < ::ApplicationController
    respond_to :js, :json, :html
    expose(:negotiation) { Negotiations.from_listing_and_buyer params[:listing_id], params[:buyer_id] }
    expose(:discussion) { Negotiations.from_discussion_id params[:discussion_id] }
  end
end