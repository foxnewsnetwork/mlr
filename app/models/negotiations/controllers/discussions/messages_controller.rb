module Negotiations
  module Controllers
    module Discussions
      class MessagesController < ::ApplicationController
        expose(:discussion) { Negotiations.from_discussion_id params[:discussion_id] }
        
        def create
          respond_with discussion.create_message params[:message]
        end
        
      end
    end
  end
end