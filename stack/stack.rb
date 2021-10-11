class Stack < Array
  # reusing array functions - push, pop, length, size
  alias top last
  alias peek top
end

