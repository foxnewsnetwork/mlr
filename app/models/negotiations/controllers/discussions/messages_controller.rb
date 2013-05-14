module Negotiations
  module Controllers
    module Discussions
      class MessagesController < ::ApplicationController
        expose(:discussion) { Negotiations.from_discussion_id params[:discussion_id] }
        
        def create
          render :json => discussion.message_from(params[:message][:company], params[:message][:text])
        end
        
      end
    end
  end
end