class SportyClient
    def post(message)
        raise "Not signed in!" unless @user
        puts "#{@user} posted message: #{message}"
    end

    def timeline
        raise "Not signed in!" unless @user
        puts "#{@user} fetched timeline..."
    end

    def sign_in(user)
        @user = user
        puts "#{user} signed in."
    end

    def sign_out(user)
        puts "#{user} signed out!"
    end

    def as_signed_in_user(user)
        sign_in(user)
        begin
            yield
        ensure
            sign_out(user)
        end
    end

    def self.open(user)
        client = self.new
        client.sign_in(user)

        return client unless block_given?

        begin
            yield(client)
        ensure
            client.sign_out(user)
        end
    end
end

# client = SportyClient.new

# client.sign_in("broncos_fan")
# client.post("Ready for the new season...")
# client.post("Broncos are going all the way!")
# client.timeline
# client.sign_out("broncos_fan")

# client = SportyClient.new

# client.as_signed_in_user("broncos_fan") do
#     client.post("Ready for the new season...")
#     client.post("Broncos are going all the way!")
#     client.timeline
# end

# client.as_signed_in_user("seahawker") do
#     client.post("Not if we can help it...")
#     raise "Boo! Hiss!"
# end

SportyClient.open("broncos_fan") do |client|
    client.post("Ready for the new season...")
    client.post("Broncos are going all the way!")
    client.timeline
end

client = SportyClient.open("broncos_fan")
client.post("Ready for the new season...")
client.post("Broncos are going all the way!")
client.timeline
client.sign_out("broncos_fan")