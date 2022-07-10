# 3. given a sentence output the frequency of each letter in the sentence 
# ignore whitespace 
# input: "this is a test string" 

def frequency(sentence)
    letters = Hash.new { |hash, key| 0 }

    sentence.chars.each do |letter|
        if letter != " "
            letters[letter] += 1
        end
    end

    p letters

end

frequency("this is a test string")