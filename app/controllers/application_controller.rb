require 'awesome_print'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  ACTIONS = ["show", "edit", "update", "destroy"]

  # before_action :set_review, only: [:show, :edit, :update, :destroy]

  # def set_review
  #   @review = Review.find(params[:id])
  # end

  # ACTIONS.each do |action|
  #   define_method("{action}") do
  #     puts "debug"
  #     p self
  #     # @restaurant = toto.capitalize.constantize.find(params[:id])
  #     # fred.instance_variable_set(:@a, 'dog')
  #   end
  # end

  define_method("show") do |arg|
    name_class = self.class.to_s.split("sC")
    var_instance = "@#{name_class[0].downcase}"
    self.instance_variable_set( var_instance, name_class[0].constantize.find(params[:id]) )
  end

  # def show
  #   name_class = self.class.to_s.split("sC")
  #   var_instance = "@#{name_class[0].downcase}"
  #   self.instance_variable_set( var_instance, name_class[0].constantize.find(params[:id]) )
  # end


  # CLASSES.each do |toto|

  #   puts "debug"

  #   p toto

  #   def index
  #     @restaurants = toto.capitalize.constantize.all
  #   end
  #   define_method("set_#{toto}") do
  #     @restaurant = toto.capitalize.constantize.find(params[:id])
  #     # fred.instance_variable_set(:@a, 'dog')
  #   end

  # end

end
