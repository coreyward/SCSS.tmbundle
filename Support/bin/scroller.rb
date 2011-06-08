# @TODO: Work with selected text

# Accept command line arguments for cleaner integration with TextMate
adjustment_value = ARGV[0].to_i

# We have to manually parse out the value next to the caret in order to determine
# the polarity of the value (negative values are valid)
current_line, line_index = ENV['TM_CURRENT_LINE'], ENV['TM_LINE_INDEX'].to_i

# If there's no dash/negation in the current line, so we can skip the manual line parsing
current_value = if current_line.include? '-'
    left = current_line[0, line_index]
    right = current_line[line_index, current_line.length]
    left[/-?(\d+[a-z%]*)?$/].to_s + right[/^-?\d*[a-z%]*/].to_s
  else
    ENV['TM_CURRENT_WORD']
end

# If we have good data, adjust the number and send it back
# @TODO: Find a way to strip the negative sign if we're going from negative to positive (or zero)
if adjustment_value.is_a?(Fixnum) && md = current_value.match(/^(?<value>-?\d+)(?<unit>px|pt|cm|mm|in|em|ex|pc|%)?/)
  return_value = md[:value].to_i + adjustment_value
  print "#{return_value.abs}#{md[:unit]}"
end
