# 1. given a sentence output this in reverse order 
# input: "this is a test string" 
# output: "string test a is this"

def reverse_sentence(input)
    p input.split.reverse.join(" ")
end

reverse_sentence("this is a test string")