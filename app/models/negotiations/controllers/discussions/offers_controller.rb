module Negotiations
  module Controllers
    module Discussions
      class OffersController < ::ApplicationController
        expose(:discussion) { Negotiations.from_discussion_id params[:discussion_id] }

        def create
          render :json => discussion.offer_from(params[:offer][:company], params[:offer][:price])
        end

        def decline
          render :json => discussion.decline_offer!(current_company, params[:id])
        end

        def accept
          render :json => discussion.accept_offer!(current_company, params[:id])
        end

      end
    end
  end
end