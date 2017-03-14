#!/usr/bin/ruby
TARGET_STRING_CONSTANT = "METHINKS IT IS LIKE A WEASEL";
ALPHABET_CONSTANT = "ABCDEFGHIJKLMNOPQRSTUVWXYZ ";
CHANCE_OF_CHANGE_CONSTANT = 5;

def randomNumber(min, max)
  return Random.rand(min...max)
end

def changeCharacter
  randomNumber(1,101) <= CHANCE_OF_CHANGE_CONSTANT
end

def get_random_char
 ALPHABET_CONSTANT[randomNumber(0,ALPHABET_CONSTANT.length)]
end

def randomString
  text = ""

  TARGET_STRING_CONSTANT.split("").each do |i|
    text << get_random_char
  end

  return text
end

def copy(str)
  scopy = ""
  str.split("").each do |i|
    if  changeCharacter
      scopy << get_random_char
    else
      scopy << str[i]
    end
  end

  return scopy;
end

def getScore(str)
  score = 0;
  oString = str.split("")
  oString.length.times do |i|
    if oString[i.to_i] == TARGET_STRING_CONSTANT[i.to_i]
      score = score + 1
    end
  end

  return score
end

def isTarget(str)
  return str == TARGET_STRING_CONSTANT
end

def writeProcess (str)
  if File.exist?('output.txt')
    File.open('output.txt', 'a+') do |f|
    f.puts(str).to_s
    end
  elsif
    write_handler = File.new("output.txt", "w")
    write_handler.puts(str).to_s
    write_handler.close
  end
end

def weasel_algorithm
  p oStr = randomString
  iteration = 1
  highest_score = 0
  n_copy = ""

  while !isTarget(oStr) && iteration < 1000
    100.times do |i|
      scopy = copy(oStr)
      score = getScore(scopy)

      if score > highest_score
        highest_score = score
        n_copy = scopy
      end
    end

    oStr = n_copy
    puts "step: #{iteration} String: #{n_copy}"
    writeProcess("step: #{iteration} String: #{n_copy}")
    iteration = iteration + 1
  end
end
weasel_algorithm