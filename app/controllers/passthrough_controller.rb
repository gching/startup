# passthrough_controller.rb
class PassthroughController < ApplicationController
  def index
  	flash.keep
    path = current_user

    redirect_to path     
  end
end
