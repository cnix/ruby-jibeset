require File.expand_path('../../../test_helper', __FILE__)

class EventTest < Jibeset::Test
  
  def setup
    @client = Jibeset.client
    @client.stubs = Faraday::Adapter::Test::Stubs.new
  end

  def test_events_should_return_events
    @client.stubs.get('/events.json') { [200, {}, '{"events":[]}'] } 
    assert_not_nil @client.events
  end

  def test_create_event_should_create_event
    payload = { :name => 'tybee', :event_type => 'series' }
    @client.stubs.post('/events.json')  { [200,{},Yajl.dump(payload)] }
    response = @client.create_event(payload)
    
    assert_equal  Yajl.dump(payload), response 
  end
end
