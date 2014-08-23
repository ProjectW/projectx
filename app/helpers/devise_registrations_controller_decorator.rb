module DeviseRegistrationsControllerDecorator
  extend ActiveSupport::Concern
 
  included do
    alias :devise_new :new
    def new; custom_new; end
  end
 
  module InstanceMethods
    def custom_new
      resource = build_resource({})
      if params.has_key?(:with_user) && session.has_key?(:last_order)
        last_order = Piggybak::Order.find(session[:last_order])
        resource.email = last_order.email
        resource.password = last_order.password
      end
      respond_with resource
    end
  end
end
 
Devise::RegistrationsController.send(:include, DeviseRegistrationsControllerDecorator)