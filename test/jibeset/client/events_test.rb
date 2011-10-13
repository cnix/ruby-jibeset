require 'test_helper'

class EventTest < Jibeset::Test
  
  def setup
    @jibeset = Jibeset.client
    @jibeset.stubs = Faraday::Adapter::Test::Stubs.new
  end

  def test_events_should_return_events
    @jibeset.stubs.get('/events.json') { [200, {}, '{"events":[]}'] } 
    assert_not_nil @jibeset.events
  end

  def test_create_event_should_create_event
    payload = { :name => 'tybee', :event_type => 'series' }
    @jibeset.stubs.post('/events.json')  { [200,{},Yajl.dump(payload)] }
    client = @jibeset.create_event(payload)
    
    assert_equal  Yajl.dump(payload), client 
  end
end
