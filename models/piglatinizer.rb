class PigLatinizer

    #attr_reader :text

    #def initialize#(text)
        #@text = text.downcase
    #end

    def piglatinize(text)
        #words = text.split(" ")
        #check if more than one word
        #binding.pry
        text.split(" ").length == 1 ? convert_word(text) : convert_sentence(text)
    end

    def convert_word(word)
        #check if starts with vowel
        if word =~ /\A[aeiouAEIOU]/
            word + "way"
        else
            consonants = []
            consonants << word[0]
            if !["a", "e", "i", "o", "u"].include?(word[1])
                consonants << word[1]
                
                if !["a", "e", "i", "o", "u"].include?(word[2])
                    consonants << word[2]
                end
            end
            "#{word[consonants.length..-1] + consonants.join + "ay"}"
        end

    end

    def convert_sentence(text)
        word_array = text.split(" ")
        word_array.collect do |word|
            convert_word(word)
        end.join(" ")
    end

end
