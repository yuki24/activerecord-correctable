$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'minitest/autorun'
require 'minitest/pride'

begin
  MiniTest::Test
rescue NameError
  MiniTest::Test = MiniTest::Unit::TestCase
end

module DidYouMean::TestHelper
  def assert_correction(expected, array)
    assert_equal Array(expected), array, "Expected #{array.inspect} to only include #{expected.inspect}"
  end
end

MiniTest::Test.send :include, DidYouMean::TestHelper

require 'rails'
require 'did_you_mean/activerecord' # TODO: change it to "active_record"
require 'rails_app/fake_app'
