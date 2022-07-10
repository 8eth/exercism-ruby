# Find the letter that is used most frequently in the dictionary and their counts
# You can find a list of words at `/usr/share/dict/words`

WORDS = File.read("/usr/share/dict/words").split("\n").map(&:downcase)

def letter_frequency(words)
    letters = Hash.new { |hash, key| 0 }
    words.each do |word|
        word.chars.each do |letter|
            letters[letter] += 1
        end
    end
    p letters.sort_by { |letter, count| count }.reverse
end

letter_frequency(WORDS)