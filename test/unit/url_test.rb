require 'test_helper'
# require 'action_controller/assertions/routing_assertions'
class URLTest < ActiveSupport::TestCase
  include ActionController::UrlWriter
  # include ActionController::Assertions::RoutingAssertion
  # default_url_options[:host]='whatever'
  # Replace this with your real tests.
  test "should return right root path" do
    default_url_options[:host]="whatever"
    expected_mapping = {:controller=>"users",:action=>"home",:username=>"tsdeng"}
    assert_equal(url_for(expected_mapping),root_url)
  end
end
