# Adopted from: 
# https://github.com/mislav/will_paginate/blob/master/spec/view_helpers/action_view_spec.rb
Routes = ActionDispatch::Routing::RouteSet.new

class DummyController
  attr_reader :request
  attr_accessor :controller_name
  
  include ActionController::UrlFor
  include Routes.url_helpers
  
  def initialize
    @request = DummyRequest.new
  end

  def params
    @request.params
  end

  def env
    {}
  end

  def _prefixes
    []
  end
end

class IbocorpController < DummyController
end

class DummyRequest
  attr_accessor :symbolized_path_parameters
  
  def initialize
    @get = true
    @params = {}
    @symbolized_path_parameters = { controller: :foo, action: :bar }
  end
  
  def get?
    @get
  end

  def post
    @get = false
  end

  def relative_url_root
    ''
  end
  
  def script_name
    ''
  end

  def params(more = nil)
    @params.update(more) if more
    @params
  end
  
  def host_with_port
    'example.com'
  end
  alias host host_with_port

  def optional_port
    ''
  end
  
  def protocol
    'http:'
  end
end