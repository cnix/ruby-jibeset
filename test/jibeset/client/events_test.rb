require File.expand_path('../../../test_helper', __FILE__)

class EventTest < Jibeset::Test
  
  def setup
    @jibeset = Jibeset.client
    @jibeset.stubs = Faraday::Adapter::Test::Stubs.new
  end

  def test_events_should_return_events
    @jibeset.stubs.get('/events.json') { [200, {}, '{"events":[]}'] } 
    refute_nil @jibeset.events
  end

  def test_event_entries_should_return_entries

  end

  def test_create_event_should_create_event
    payload = { :name => 'tybee', :event_type => 'series' }
    @jibeset.stubs.post('/events.json')  { [200,{},Yajl.dump(payload)] }
    client = @jibeset.create_event(payload)
    
    assert_equal Yajl.dump(payload), client
  end

  def test_update_event_should_update_event

  end

  def test_destroy_event_should_destroy_event

  end

  def test_register_entry

  end


end
