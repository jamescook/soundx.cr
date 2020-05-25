module Soundx
  VERSION = "0.1.0"
  OUTPUT_LENGTH = 4

  def self.encode(string : String)
    buffer = IO::Memory.new(OUTPUT_LENGTH)
    if string[0].ord > 95 # Conditional upcase
      buffer << (string[0].ord - 32).chr
    else
      buffer << string[0]
    end

    i = 1
    writes = 1
    len = string.size

    loop do
      break if writes == OUTPUT_LENGTH || i >= len
      if i > 1 && string[i] == string[i-1] # Skip consecutive, duplicate characters
        i += 1
        next
      end

      case string[i] # a Char type
      when 'B', 'P', 'V', 'b', 'p', 'v'
        buffer << 1
        writes += 1
      when 'C', 'G', 'J', 'K', 'Q', 'S', 'X', 'Z', 'c', 'g', 'j', 'k', 'q', 's', 'x', 'z'
        buffer << 2
        writes += 1
      when 'D', 'T', 'd', 't'
        buffer << 3
        writes += 1
      when 'L', 'l'
        buffer << 4
        writes += 1
      when 'M', 'N', 'm', 'n'
        buffer << 5
        writes += 1
      when 'R', 'r'
        buffer << 6
        writes += 1
      end
      i += 1
    end

    until writes == OUTPUT_LENGTH
      buffer << '0'
      writes += 1
    end

    buffer.to_s
  end
end
