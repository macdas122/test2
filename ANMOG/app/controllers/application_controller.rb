class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_skc!

    def set_current_user
      Skc.current = current_skc
    end
end

class PostsController < ApplicationController
  before_action :require_skc # require_skc will set the current_skc in controllers
  before_action :set_current_skc
end
