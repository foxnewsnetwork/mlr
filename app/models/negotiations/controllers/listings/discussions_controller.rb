module Negotiations
  module Controllers
    module Listings
      class DiscussionsController < ::ApplicationController
        respond_to :js, :json, :html
        expose(:discussion) { Negotiations.from_listing_and_buyer params[:listing_id], params[:buyer_id] }
        
        def create
          render :json => discussion
        end

      end
    end
  end
end