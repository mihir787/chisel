class Chisel
  def initialize
    @doc = ""
  end

  def parse(document)
    @doc = document
    add_paragraphs
    add_headers
    output
  end

  def output
    @doc
  end

  def seperate_chars
    @doc.chars
  end

  def seperate_lines
    line_collector = []
    @doc.each_line do |line|
      line_collector << line
    end
    line_collector
  end
##not getting the last <n/p> to print
  def add_paragraphs
    lines = seperate_lines
    max_index = lines.size - 1
    (1..(max_index)).each do |index|
      previous_line = lines[index -1]
      current_line = lines[index]
      next_line = lines[index + 1]
      if current_line[0] != ("#" || "\n" || "</p>")
        if previous_line[0] == "\n"
          lines.insert(index, "<p>\n")
        elsif next_line[0] == "\n"
          lines.insert(index + 1, "\n</p>")
        elsif next_line == nil
          lines << "\n</p>"
        else
          lines
        end
      end
    end
    @doc = lines.join
  end

  def add_headers
    lines = seperate_lines
    lines.each do |line|
      number_of_hashes = hash_count(line.chars)
      if number_of_hashes > 0
        line[(0..number_of_hashes)] = "<h#{number_of_hashes}>"
        line.insert(-2,"</h#{number_of_hashes}>" )
      else
        line
      end
    end
    @doc = lines.join
  end

  def hash_count(chars_in_line)
    hash_marks = chars_in_line.select {|c| c == "#"}
    hash_marks.size
  end
end

document = '# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."'
parser = Chisel.new
output = parser.parse(document)
puts output



# class Chisel
#
#   def initialize
#     @line_counter = 0
#     @line_collector = []
#   end
#
#   def parse(document)
#     string = document
#     seperate_line(string)
#     add_headers
#     add_paragraphs
#     output
#   end
#
#   def output
#     @line_collector.join
#   end
#
#   def seperate_line(document)
#     document.each_line do |line|
#       @line_collector << line
#     end
#   end
#
#   def add_paragraphs
#     max_index = @line_collector.size - 1
#     (1..(max_index)).each do |index|
#       previous = @line_collector[index -1]
#       current = @line_collector[index]
#       proceeding = @line_collector[index + 1]
#       if current[0] != ("<" || "\n") && previous[0] == "\n"
#         @line_collector.insert(index, "<p>\n")
#       elsif current[0] != ("<" || "\n") && proceeding[0] == "\n"
#         @line_collector.insert(index + 1, "</p>\n")
#       else
#         @line_collector
#       end
#     end
#   end
#
#   def add_headers
#     @line_collector.map! do |line|
#       number_of_hashes = hash_count(line.chars)
#       if number_of_hashes > 0
#         line[(0..number_of_hashes)] = "<h#{number_of_hashes}>"
#         line.insert(-2,"</h#{number_of_hashes}>" )
#       else
#         line
#       end
#     end
#   end
#
#   def hash_count(char_lines)
#     hash_marks = char_lines.select {|c| c == "#"}
#     hash_marks.size
#   end
#
# end
#
# document = '# Bridge under***
#
# ## the water
#
# the fish is good
# but the chicken is better
#
# '
# parser = Chisel.new
# output = parser.parse(document)
# puts output



#   def add_headers
#     @line_collector.map! do |line|
#       split_line_array = line.split(" ")
#       first_characters = split_line[0]
#       if first_characters.start_with?("#")
#         header_number = first_characters.length
#         line[(0..header_number + 1)] = "<h#{header_number}>"
#         line << "</h#{header_number}>"
#       else
#         line
#       end
#     end
#   end
# end
#
# chars_array = line.chars
# #find_number of hashes
# hashes = chars_array.select {|c| c == "#"}
# hash_count = hashes.size





# # "# My Life in Desserts\n\n## Chapter 1: The Beginning\n\n\"You just *have* to try the cheesecake,\" he said.\"Ever since it appeared in\n**Food & Wine** this place has been packed every night.\""
# takes the line, puts it into an an array for the line seperated by spaces
#
# cycle throught the array and compare the string
#
#
# # what parse will do:
# #   1. take in a string X
# #   2. go line by line through the string and look
# #   for certain symbols or characters.
# #   3. once those are found, they are replaced with a
# #   a markdown character, which will be the output.
# #USE MAP WITH INDEX!!!!!!!!
#
#
# # parser = Chisel.new
# # output = parser.parse(document)
# # puts output
#
# chisel = Chisel.new
# puts chisel.parse("THIS IS PARSE")
