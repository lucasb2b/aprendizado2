class WordAnalyzer
  MAX_CHAR = 26

  def self.get_key(str)
    visited = Array.new(MAX_CHAR, false)

    str.each_char do |char|
      visited[char.ord - 97] = true
    end

    key = ""
    MAX_CHAR.times do |j|
      key += (97 + j).chr if visited[j]
    end

    key
  end

  def self.words_with_same_char_set(words)
    hash = {}

    words.each_with_index do |word, i|
      key = get_key(word)
      if hash.key?(key)
        hash[key].push(i)
      else
        hash[key] = [i]
      end
    end

    result = []
    hash.each_value do |indexes|
      result << indexes.map { |index| words[index] }
    end

    result
  end
end

# Test the WordAnalyzer class
words = [
  "may", "student", "students", "dog", "studentssess",
  "god", "cat", "act", "tab", "bat", "flow", "wolf",
  "lambs", "amy", "yam", "balms", "looped", "poodle"
]

result = WordAnalyzer.words_with_same_char_set(words)

result.each do |group|
  puts group.join(", ")
end