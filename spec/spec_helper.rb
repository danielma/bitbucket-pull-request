$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

Dir[File.dirname(__FILE__) + "/support/**.rb"].each{|support_file| require support_file }

require 'bitbucket-pull-request'
