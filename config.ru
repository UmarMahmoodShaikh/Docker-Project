# This file is used by Rack-based servers to start the application.
require "rack/attack"
use Rack::Attack
require_relative "config/environment"

# require 'faker'

run Rails.application
Rails.application.load_server
