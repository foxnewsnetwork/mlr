module Negotiations
  module Controllers
    class DiscussionsController < ::ApplicationController
      respond_to :js, :json, :html
      expose(:discussion) { Negotiations.from_discussion_id params[:discussion_id] }

      def show
        respond_with discussion
      end

    end
  end
end