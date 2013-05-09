module Negotiations
  module Controllers
    module Discussions
      class OffersController < ::ApplicationController
        expose(:discussion) { Negotiations.from_discussion_id params[:discussion_id] }

        def create
          respond_with discussion.create_offer params[:offer]
        end

        def decline
          respond_with discussion.decline_offer params[:offer]
        end

        def accept
          respond_with discussion.accept_offer params[:offer]
        end

      end
    end
  end
end