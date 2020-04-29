require 'timeout'

# Timeout.timeout(2.0) do
#     sleep 3.0
#     puts "That was refreshing..."
# end

def try_with_timeout(timeout)
    begin
        Timeout.timeout(timeout) do
            yield
        end
    rescue Timeout::Error
        puts "Took too long!"
    end
end

# try_with_timeout(2.0) do
#     sleep 1.0
#     puts "That was refreshing..."
# end

# try_with_timeout(2.0) do
#     sleep 3.0
#     puts "Yawn..."
# end

require 'open-uri'
web_page = try_with_timeout(1.0) do
    open("http://example.com/")
end

puts web_page.read

# require 'net/http'

# uri = URI('http://example.com')

# Net::HTTP.start(uri.host, uri.port) do |http|
#   request = Net::HTTP::Get.new(uri)

#   response = http.request(request)
#   p response
# end

# def connect(db_args, user, auth, params)
#     dbh = DatabaseHandle.new(...)
#     if block_given?
#       begin
#         yield dbh
#       ensure
#         dbh.disconnect if dbh.connected?
#       end
#     else
#       dbh
#     end
# end

# def execute(stmt)
#     sth = StatementHandle.new(...)
  
#     if block_given?
#       begin
#         yield sth
#       ensure
#         sth.finish unless sth.finished?
#       end
#     else
#       sth
#     end
# end