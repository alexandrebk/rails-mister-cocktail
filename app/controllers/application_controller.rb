require 'awesome_print'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  ACTIONS = ["show", "edit", "update", "destroy"]

  # before_action :set_review, only: [:show, :edit, :update, :destroy]


  ACTIONS.each do |action|
    define_method("#{action}") do
      class_name        = self.class.to_s.split("sC")
      instance_variable = "@#{class_name[0].downcase}"
      self.instance_variable_set( instance_variable, class_name[0].constantize.find(params[:id]) )
    end
  end

end
