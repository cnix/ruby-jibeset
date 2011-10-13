require File.expand_path('../../test_helper', __FILE__)

class ConfigurationTest < Jibeset::Test

  def setup
    @valid_config = Jibeset::Test.valid_config
  end

  def test_valid_options
    @valid_config.call
    Jibeset::Configuration::VALID_OPTIONS_KEYS.each do |key|
      assert Jibeset.options.include? key
    end
  end

  def test_configure
    @valid_config.call
    assert_equal Jibeset.oauth_callback, nil
  end

  def test_reset
    Jibeset.reset
    assert_equal nil, Jibeset.oauth_callback
  end

end
