require "yaml"

def load_library(file_path)
  emoticon_lib = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  YAML.load_file(file_path).each do |emotion, emoticons|
    english_emoticon = emoticons[0]
    japanese_emoticon = emoticons[1]
    emoticon_lib["get_emoticon"][english_emoticon] = japanese_emoticon
    emoticon_lib["get_meaning"][japanese_emoticon] = emotion
  end
  emoticon_lib
end

def get_japanese_emoticon(file_path, emoticon)
  lib = load_library(file_path)
  japan_emo = lib["get_emoticon"]
  if japan_emo[emoticon]
    return japan_emo[emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  lib = load_library(file_path)
  emotion_meaning = lib["get_meaning"]
  if emotion_meaning[emoticon]
    return emotion_meaning[emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
