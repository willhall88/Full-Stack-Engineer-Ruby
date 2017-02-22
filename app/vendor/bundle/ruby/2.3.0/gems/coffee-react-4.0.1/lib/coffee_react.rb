require 'rubygems'
require 'execjs'

module CoffeeReact
  Error            = ExecJS::Error
  EngineError      = ExecJS::RuntimeError
  CompilationError = ExecJS::ProgramError

  module Source
    def self.path(filename)
      File.expand_path("../#{filename}", File.dirname(__FILE__))
    end

    def self.context(filename)
      ExecJS.compile(File.read(self.path(filename)))
    end

    def self.transform_context
      @transform_context ||= self.context('coffee-react-transform.js')
    end

    def self.jstransform_context
      @jstransform_context ||= self.context('js-syntax-transform.js')
    end
  end

  class << self
    def engine
    end

    def engine=(engine)
    end

    def transform(script, options = {})
      script = script.read if script.respond_to?(:read)

      Source.transform_context.call("coffeeReactTransform", script, options)
    end

    def jstransform(script)
      script = script.read if script.respond_to?(:read)

      Source.jstransform_context.call("coffeeReactJSSyntaxTransform", script)
    end
  end
end
