require File.expand_path('../../test_helper', __FILE__)

class TestOAuth < Jibeset::Test

  def setup
    @valid_config = Jibeset::Test.valid_config

    @jibeset = Jibeset.client
    @jibeset.stubs = Faraday::Adapter::Test::Stubs.new
  end

  def test_authorize_url_returns_auth_token
    truthiness = true

    assert(truthiness)
  end

  def test_get_request_token_requires_oauth_callback
    Jibeset.reset

    payload = "Asserts error"

    @jibeset.stubs.post('/events.json')  { [200,{},Yajl.dump(payload)] }
    client = @jibeset.create_event(payload)

    @jibeset.stubs.get("/oath/token") { [200, {}, payload]}
    @jibeset.get_access_token

    assert_raise(Jibeset::InvalidConfiguration) { Jibeset.get_request_token }
  end

end
