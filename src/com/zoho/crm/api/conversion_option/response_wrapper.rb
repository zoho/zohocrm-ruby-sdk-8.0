require_relative '../util/model'

module ZOHOCRMSDK
  module ConversionOption
    require_relative 'response_handler'
    class ResponseWrapper
      include Util::Model
      include ResponseHandler

      # Creates an instance of ResponseWrapper
      def initialize
        @conversion_options = nil
        @key_modified = Hash.new
      end

        # The method to get the conversion_options
        # @return An instance of ConversionOptions

      def conversion_options
        @conversion_options
      end

        # The method to set the value to conversion_options
        # @param conversion_options [ConversionOptions] An instance of ConversionOptions

      def conversion_options=(conversion_options)
        if conversion_options!=nil and !conversion_options.is_a? ConversionOptions
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: conversion_options EXPECTED TYPE: ConversionOptions', nil, nil)
        end
        @conversion_options = conversion_options
        @key_modified['__conversion_options'] = 1
      end

        # The method to check if the user has modified the given key
        # @param key [String] A String
        # @return A Integer value

      def is_key_modified(key)
        if key!=nil and !key.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: key EXPECTED TYPE: String', nil, nil)
        end
        if @key_modified.key?(key)
          return @key_modified[key]
        end

        nil
      end

        # The method to mark the given key as modified
        # @param key [String] A String
        # @param modification [Integer] A Integer

      def set_key_modified(key, modification)
        if key!=nil and !key.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: key EXPECTED TYPE: String', nil, nil)
        end
        if modification!=nil and !modification.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: modification EXPECTED TYPE: Integer', nil, nil)
        end
        @key_modified[key] = modification
      end

    end
  end
end
