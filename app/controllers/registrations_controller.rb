# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication, :only => [:new, :create]
  def new
    #@user = User.new
    super
  end

  def create
    super

  end

  def update
    super
  end

end