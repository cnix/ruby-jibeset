require File.expand_path('../jibeset/error', __FILE__)
require File.expand_path('../jibeset/configuration', __FILE__)
require File.expand_path('../jibeset/api', __FILE__)
require File.expand_path('../jibeset/client', __FILE__)

module Jibeset
  extend Configuration

  # Alias for Jibeset::Client.new
  #
  # @return [Jibeset::Client]
  def self.client(options={})
    Jibeset::Client.new(options)
  end

  # Delegate to Jibeset::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Jibeset::Client
  def self.respond_to?(method)
    return client.respond_to?(method) || super
  end
end

