require "faraday"
require "faraday_middleware"
require "impermium/configuration"
require "impermium/content"

module Impermium
  class Client
    include Configuration
    include Content
    
    def initialize(options = {})
      options = Impermium.options.merge(options)
      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    def connection
      @connection ||= Faraday.new(:url => endpoint, :headers => default_headers) do |builder|
        builder.request :json
        builder.adapter adapter
        builder.use Faraday::Response::Mashify
        builder.use Faraday::Response::ParseJson
        builder.use Faraday::Response::Logger
      end
    end

    def post(url, options={})
      connection.post do |req|
        req.url api_url(url)
        req.headers['Content-Type'] = 'application/json'
        req.body = options
      end
    end

    private

    def default_headers
      { :http_user_agent => "Impermium Ruby Gem",
        :http_accept => "application/json"}
    end

    def api_url(request_part, event_id = "impermium_gem_event_id_1")
      "#{endpoint}/#{request_part}/#{api_version}/#{api_key}/#{event_id}"
    end
  end
end

