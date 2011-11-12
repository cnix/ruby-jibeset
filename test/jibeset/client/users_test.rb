require File.expand_path('../../../test_helper', __FILE__)

class UsersTest < Jibeset::Test
  
  def setup
    # user = {:username => 'cnix', :id => 1}

    # client = Faraday.new do |builder|
    #   builder.adapter :test, @stubs do |stub|
    #     stub.get('/users/#{user[:username]}.json') {[ 200, {}, Yajl.dump(user) ]}
    #   end
    # end

    @client = Jibeset.client
    @client.stubs = Faraday::Adapter::Test::Stubs.new
    # client.user = user
    
    # client = Jibeset.client
    # client.stubs = Faraday::Adapter::Test::Stubs.new
    # @client.stubs.get("/users/*.json") { [ 200, {}, Yajl.dump(user) ] }
    # # debugger
    # @user = @client.user(:username => 'cnix')
    # @user.stubs = Faraday::Adapter::Test::Stubs.new
    # @events = []
  end

  def test_me_should_get_authenticated_user_for_client
    response = '{"username":"cnix", "email":"claude@seadated.com"}'
    @client.stubs.get('/me.json') { [200, {}, response] }

    assert_equal response, @client.me
  end

  # def test_events_should_return_events
  #   @jibeset.stubs.get('/events.json') { [200, {}, '{"events":[]}'] } 
  #   assert_not_nil @jibeset.events
  # end

  # def test_create_event_should_create_event
  #   payload = { :name => 'tybee', :event_type => 'series' }
  #   @jibeset.stubs.post('/events.json')  { [200,{},Yajl.dump(payload)] }
  #   client = @jibeset.create_event(payload)
  #   
  #   assert_equal  Yajl.dump(payload), client 
  # end

  # def test_events_gets_events_for_user
  #   @user.stubs.get("/#{@user.username}/events.json") { [200, {}, Yajl.dump(@events) ] }
  #   events = @user.events
  #   assert_equal Yajl.dump(events), @events 
  # end
end

