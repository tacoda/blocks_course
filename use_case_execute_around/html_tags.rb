# def h1
#     print "<h1>"
#     print yield
#     print "</h1>"
# end

# h1 { "Breaking News!" }

# def h2
#     print "<h2>"
#     print yield
#     print "</h2>"
# end

# h2 { "Massive Ruby Discovered" }

def tag(type)
    print "<#{type}>"
    print yield
    print "</#{type}>"
end

# tag(:h1) { "Breaking News!" }
# tag(:h2) { "Massive Ruby Discovered" }

tag(:ul) do
    tag(:li) { "It sparkles!" }
    tag(:li) { "It shines!" }
    tag(:li) { "It mesmerizes!" }
end