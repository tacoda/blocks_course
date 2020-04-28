module Jem
    class Specification
        attr_accessor :name, :version, :summary

        def initialize
            @version = '1.0.0'
            # default initialization
            yield(self) if block_given?
        end
    end
end

spec = Jem::Specification.new do |s|
    s.name      = 'my-gem'
    s.version   = '2.0.0'
    s.summary   = "This is a cool gem!"
end

# spec = Jem::Specification.new
# spec.name = "Mike"

p spec