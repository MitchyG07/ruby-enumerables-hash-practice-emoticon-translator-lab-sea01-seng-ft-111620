require "yaml"
require "pry"

def load_library(emoticon_file)
new_hash = {}
  emoticons = YAML.load_file(emoticon_file)  
  emoticons.each do |key, value|
  		hash = { :english => value[0], :japanese => value[1] }  
        new_hash[key] = hash
        binding.pry
   end
   p new_hash
end

def load_library_for_use(yml)
  library = YAML.load_file(yml)
   puts load_library 
end 

def get_japanese_emoticon(yml, english_emoticon)
  sorry_message = "Sorry, that emoticon was not found"
  translation = ""
  lib = load_library(yml)
  library = load_library_for_use(yml)
  array = library.each_with_object({}) do |(key, value), array|
    # binding.pry 
    value.each do |emoticon|
      if emoticon == english_emoticon
        translation = value[1]
        puts translation 
      end
    end 
  end 
  
  if translation == ""
    puts sorry_message
    return sorry_message
  else 
    return translation
  end 
end


def get_english_meaning(yml, japanese_emoticon)
  sorry_message = "Sorry, that emoticon was not found"
  translation = ""
  lib = load_library(yml)
  library = load_library_for_use(yml)
  array = library.each_with_object({}) do |(key, value), array|
    binding.pry 
    value.each do |emoticon|
      if emoticon == japanese_emoticon
        translation = key
        puts translation 
      end
    end 
  end 
  
  if translation == ""
    puts sorry_message
    return sorry_message
  else 
    return translation
  end 
end

 