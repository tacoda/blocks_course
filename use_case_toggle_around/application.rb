class Application
    attr_accessor :environment

    def initialize
        @environment = :development
    end

    def connect_to_database
        puts "Connecting to #{@environment} database..."
    end

    def handle_request
        puts "Handling #{@environment} request..."
    end

    def write_to_log
        puts "Writing to #{@environment} log file..."
    end

    def in_production
        old_environment = @environment
        @environment = :production
        yield
    rescue Exception => e
        puts e.message
    ensure
        @environment = old_environment
        puts "Reset environment to #{@environment}"
    end

    def in_environment(env)
        old_environment = @environment
        @environment = env
        yield
    rescue Exception => e
        puts e.message
    ensure
        @environment = old_environment
        puts "Reset environment to #{@environment}"
    end
end

# app = Application.new

# app.in_production do
#     app.connect_to_database
#     app.handle_request
#     raise "Boom!"
#     app.write_to_log
# end

# app.in_environment(:production) do
#     app.connect_to_database
#     app.handle_request
#     app.write_to_log
# end

# app.in_environment(:test) do
#     app.connect_to_database
#     app.handle_request
#     app.write_to_log
# end

# def silence_warnings
#     oldverbose = $VERBOSE
#     $VERBOSE = false
#     yield
# ensure
#     $VERBOSE = oldverbose
# end

# def silence_warnings
#     $VERBOSE, v = false, $VERBOSE
#     yield
# ensure
#     $VERBOSE = v
# end

# def with_verbose(v)
#     oldverbose = $VERBOSE
#     $VERBOSE = v
#     yield
# ensure
#     $VERBOSE = oldverbose
# end

# def silently
#     previous_logger = Configuration.logger
#     Configuration.logger = nil
#     yield
# ensure
#     Configuration.logger = previous_logger
# end

# def with_locale(new_locale)
#     old_locale = I18n.locale
#     I18n.locale = new_locale
#     yield
# ensure
#     I18n.locale = old_locale
# end

# def travel_to(date_or_time)
#     if date_or_time.is_a?(Date) && !date_or_time.is_a?(DateTime)
#       now = date_or_time.midnight.to_time
#     else
#       now = date_or_time.to_time.change(usec: 0)
#     end
  
#     simple_stubs.stub_object(Time, :now, now)
#     simple_stubs.stub_object(Date, :today, now.to_date)
#     simple_stubs.stub_object(DateTime, :now, now.to_datetime)
  
#     if block_given?
#       begin
#         yield
#       ensure
#         travel_back
#       end
#     end
# end

# def with_default_currency(iso_code)
#     original_default = Money.default_currency
#     Money.default_currency = Money::Currency.new(iso_code)
#     yield
# ensure
#     Money.default_currency = original_default
# end

require 'stringio'

def capture_output
    begin
      old_output = $stdout
      $stdout = StringIO.new
      yield
      result = $stdout.string
    ensure
      $stdout = old_output
    end
    result
end

output = capture_output do
    puts "Hello!"
    puts "Pleased to meet you."
    puts "Goodbye..."
end

puts output