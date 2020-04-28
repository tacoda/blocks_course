class Canvas
    attr_accessor :width, :height, :color

    def initialize
        @width = 100
        @height = 100
        @color = :black
        yield self if block_given?
    end

    def draw_rect(x, y, width, height)
    end

    def to_s
        "#{@width}x#{height} #{color} canvas"
    end
end

canvas = Canvas.new
puts canvas

canvas = Canvas.new
canvas.width = 250
canvas.height = 500
canvas.color = :blue
puts canvas

canvas = Canvas.new do |c|
    c.width = 800
    c.height = 600
    c.color = :green
end

puts canvas

# user = User.new do |u|
#     u.name = "Larry"
#     u.email = "larry@example.com"
#     u.occupation = "Comedian"
# end

# Rake::TestTask.new do |t|
#     t.libs << "test"
#     t.test_files = FileList['test/test*.rb']
#     t.verbose = true
#   end
  
# Rake::PackageTask.new("rake", "1.2.3") do |p|
#     p.need_tar = true
#     p.package_files.include("lib/**/*.rb")
# end
  
# Rake::RDocTask.new(:rdoc_dev) do |rd|
#     rd.main = "README.doc"
#     rd.rdoc_files.include("README.rdoc", "lib/**/*.rb")
#     rd.options << "--all"
# end

# The OptionParser class in the Ruby standard library parses command-line arguments. It's typically initialized using a block.
# OptionParser.new do |opts|
#     opts.banner = "Usage: example.rb [options]"
#     opts.separator ""
  
#     opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
#       options[:verbose] = v
#     end
# end

# conn = Faraday.new("https://twitter.com/search") do |faraday|
#     faraday.params["q"]   = "ruby"
#     faraday.params["src"] = "typd"
#     faraday.response      :logger                 # log requests to STDOUT
#     faraday.adapter       Faraday.default_adapter # make requests with Net::HTTP
# end