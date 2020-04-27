class Phone
    attr_accessor :airplane_mode

    def initialize
        @airplane_mode = false
    end

    def text(message)
        if @airplane_mode
            puts "Saved text: #{message}"
        else
            puts "Sent text: #{message}"
        end
    end

    # def in_airplane_mode
    #     @airplane_mode = true
    #     yield
    #     @airplane_mode = false
    # end

    def in_airplane_mode
        @airplane_mode = true
        yield
    rescue Exception => e
        puts e.message
    ensure
        @airplane_mode = false
    end

    # Can drop rescue block if not interested in handling the execption here
    # But be sure to remember the ensure block
    # def in_airplane_mode
    #     @airplane_mode = true
    #     yield
    # ensure
    #     @airplane_mode = false
    # end
end

phone = Phone.new

# phone.airplane_mode = true
# phone.text("Just took off!")
# phone.text("At 30,000 ft!")
# phone.airplane_mode = false

phone.in_airplane_mode do
    phone.text("Just took off!")
    phone.text("At 30,000 ft!")
    # phone.call
    # phone.email
    raise "Whoops!"
end

phone.text("Just landed!")