require "sequel/plugins/json/version"
require 'sequel/plugins/serialization'
require 'yajl'

module Sequel
  module Plugins
    module Json
      module Serialize
        def self.call(value)
          return value if value.nil? || value.kind_of?(String)
          Yajl::Encoder.encode(value)
        end
      end

      module Deserialize
        def self.call(value)
          return if value.nil?
          Yajl::Parser.parse(value)
        end
      end
    end

    Serialization.register_format(:json, Json::Serialize, Json::Deserialize)
  end
end
