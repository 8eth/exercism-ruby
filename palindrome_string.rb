# 2. given a word , output true if it's a palindrome and false if it is not 
# NOTE: you cannot use the reverse method 
# hannah, racecar, tacocat are palindromes so output true 
# asdf output(print) false

def palindrome(word)
    arr = []
    # p word.reverse == word ## only this line needed if using reverse
    word.chars.each do |letter|
        arr.unshift(letter)
    end
    p arr.join == word
end

palindrome("racecar")
palindrome("asdf")