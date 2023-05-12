require "active_resource"

module ActiveResource
  module Attributes
    def self.included(base)
      base.include ActiveModel::Attributes
      base.prepend CompatibilityPatch
    end

    module CompatibilityPatch
      def initialize(attributes = {}, persisted = false)
        @attributes = self.class._default_attributes.deep_dup
        @prefix_options = {}
        @persisted = persisted
        load(attributes, false, persisted)
      end

      def load(attributes, remove_root = false, persisted = false)
        unless attributes.respond_to?(:to_hash)
          raise ArgumentError, "expected attributes to be able to convert to Hash, got #{attributes.inspect}"
        end

        attributes = attributes.to_hash
        @prefix_options, attributes = split_options(attributes)

        if attributes.keys.size == 1
          remove_root = self.class.element_name == attributes.keys.first.to_s
        end

        attributes = Formats.remove_root(attributes) if remove_root

        attributes.each do |key, value|
          attribute_value =
            case value
            when Array
              resource = nil
              value.map do |attrs|
                if attrs.is_a?(Hash)
                  resource ||= find_or_create_resource_for_collection(key)
                  resource.new(attrs, persisted)
                else
                  attrs.duplicable? ? attrs.dup : attrs
                end
              end
            when Hash
              resource = find_or_create_resource_for(key)
              resource.new(value, persisted)
            else
              value.duplicable? ? value.dup : value
            end

          public_send("#{key}=", attribute_value)
        end
        self
      end
    end
  end
end
