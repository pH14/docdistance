require './lib/docdist'
class ApplicationController < ActionController::Base
  protect_from_forgery
  include DocumentDistance
end
