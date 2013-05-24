require 'spec_helper'

describe 'ViewHelper' do
  
  before(:each) do
    @assigns = {}
    @controller = DummyController.new
    @request = @controller.request
    @template = "<%= will_toggle %>"
  end
  
  def render(locals)
    @view = ActionView::Base.new([], @assigns, @controller)
    @view.request = @request
    @view.singleton_class.send(:include, @controller._routes.url_helpers)
    @view.render(:inline => @template, :locals => locals)
  end
  
  it 'should raise an error when no partial is passed' do
    
  end
end