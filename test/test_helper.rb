require 'minitest/autorun'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'jibeset'

#warn "#{__FILE__}:#{__LINE__}: version info: #{Jibeset::VERSION_INFO.inspect}"

module Jibeset
  class Test < MiniTest::Spec
    def self.valid_config
      -> {
        Jibeset.configure do |config|
          Jibeset.adapter          = :net_http
          Jibeset.client_id        =  nil
          Jibeset.client_secret    =  nil
          Jibeset.access_token     =  nil
          Jibeset.oauth_callback   =  nil
          Jibeset.endpoint         = 'http://jibeset.heroku.com/'
          Jibeset.format           = 'json'
          Jibeset.user_agent       = 'Jibeset Ruby Gem 0.1'
          Jibeset.proxy            =  'wtf'
        end
      }
    end
  end

  class API
    attr_accessor :stubs

    def connection
      options = {
        :headers => {'Accept' => "application/#{format}; charset=utf-8", 'User-Agent' => user_agent},
        :proxy => proxy,
        :ssl => {:verify => false},
        :url => endpoint,
        :client_id => client_id,
        :access_token => access_token
      }

      Faraday.new(options) do |connection|
        connection.request :json
        connection.adapter :test, @stubs
      end
    end
  end

end


#### test
#
#  def flunk(msg=nil)
#  def pass(msg=nil)
#  def skip(msg=nil, bt=caller)
#
#  assert(test, msg=nil)
#  assert_block(msg=nil)
#  assert_empty(obj, msg=nil)
#  assert_equal(exp, act, msg=nil)
#  assert_in_delta(exp, act, delta=0.001, msg=nil)
#  assert_in_epsilon(a, b, epsilon=0.001, msg=nil)
#  assert_includes(collection, obj, msg=nil)
#  assert_instance_of(klass, obj, msg=nil)
#  assert_kind_of(klass, obj, msg=nil)
#  assert_match(exp, act, msg=nil)
#  assert_nil(obj, msg=nil)
#  assert_operator(o1, op, o2, msg=nil)
#  assert_raises(*exp)
#  assert_respond_to(obj, meth, msg=nil)
#  assert_same(exp, act, msg=nil)
#  assert_send(send_ary, msg=nil)
#  assert_throws(sym, msg=nil)
#
#  refute(test, msg=nil)
#  refute_empty(obj, msg=nil)
#  refute_equal(exp, act, msg=nil)
#  refute_in_delta(exp, act, delta=0.001, msg=nil)
#  refute_in_epsilon(a, b, epsilon=0.001, msg=nil)
#  refute_includes(collection, obj, msg=nil)
#  refute_instance_of(klass, obj, msg=nil)
#  refute_kind_of(klass, obj, msg=nil)
#  refute_match(exp, act, msg=nil)
#  refute_nil(obj, msg=nil)
#  refute_operator(o1, op, o2, msg=nil)
#  refute_respond_to(obj, meth, msg=nil)
#  refute_same(exp, act, msg=nil)
#
#### spec
#
#  must_be_close_to
#  must_be_empty
#  must_be_instance_of
#  must_be_kind_of
#  must_be_nil
#  must_be_same_as
#  must_be_within_delta
#  must_be_within_epsilon
#  must_equal
#  must_include
#  must_match
#  must_raise
#  must_respond_to
#  must_send
#  must_throw
#
#  wont_be_close_to
#  wont_be_empty
#  wont_be_instance_of
#  wont_be_kind_of
#  wont_be_nil
#  wont_be_same_as
#  wont_be_within_delta
#  wont_be_within_epsilon
#  wont_equal
#  wont_include
#  wont_match
#  wont_raise
#  wont_respond_to
#  wont_send
#  wont_throw