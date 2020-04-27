# puts "Got here!"

# magic_number = (23 - Time.now.hour) * Math::PI

# puts "Result was #{result}"

def with_debugging
    puts "Got here!"
    result = yield
    puts "Result was #{result}"
end

with_debugging do
    magic_number = (23 - Time.now.hour) * Math::PI
end

def with_expectation(expected)
    puts "Running test..."
    actual = yield
    if actual == expected
        puts "Passed."
    else
        puts "Failed!"
        puts "Expected #{expected}, but got #{actual}."
    end
end

with_expectation(4) { 2 + 2 }
with_expectation(5) { 2 + 2 }