# frozen_string_literal: true

module CovidTrackerApi
  class Client
    module Queries
      def self.included(base)
        base.const_get(:AVAILABLE_QUERIES).each do |resource|
          define_method(resource) do |country = nil|
            response = self.class.get("/#{resource}/#{country}")
            OpenStruct.new(response.parsed_response)
          end
        end
      end
    end
  end
end
