module Soundx
  VERSION = "0.1.0"
  OUTPUT_LENGTH = 4

  def self.encode(string : String)
    String.build do |buffer|
      i, writes, skip_next_soundex_code, last_code = 0, 0, 0, 0
      len = string.size

      loop do
        break if writes == OUTPUT_LENGTH || i >= len
        if i > 0 && string[i].downcase == string[i-1].downcase # Skip consecutive, duplicate characters
          i += 1
          next
        end

        case string[i].upcase # a Char type
        when 'H', 'W' # Special handling for H and W per archives.org
          skip_next_soundex_code = last_code
        when 'B', 'F', 'P', 'V'
          unless skip_next_soundex_code == 1
            buffer << (i == 0 ? string[i].upcase : '1')
            skip_next_soundex_code = last_code = 1
            writes += 1
          end
        when 'C', 'G', 'J', 'K', 'Q', 'S', 'X', 'Z'
          unless skip_next_soundex_code == 2
            buffer << (i == 0 ? string[i].upcase : '2')
            skip_next_soundex_code = last_code = 2
            writes += 1
          end
        when 'D', 'T'
          unless skip_next_soundex_code == 3
            buffer << (i == 0 ? string[i].upcase : '3')
            skip_next_soundex_code = last_code = 3
            writes += 1
          end
        when 'L'
          unless skip_next_soundex_code == 4
            buffer << (i == 0 ? string[i].upcase : '4')
            skip_next_soundex_code = last_code = 4
            writes += 1
          end
        when 'M', 'N'
          unless skip_next_soundex_code == 5
            buffer << (i == 0 ? string[i].upcase : '5')
            skip_next_soundex_code = last_code = 5
            writes += 1
          end
        when 'R', 'r'
          unless skip_next_soundex_code == 6
            buffer << (i == 0 ? string[i].upcase : '6')
            skip_next_soundex_code = last_code = 6
            writes += 1
          end
        else
          # Ensure we handle vowels if they are the first letter
          if i == 0
            buffer << string[i].upcase
            writes += 1
          end
          # Reset
          skip_next_soundex_code = 0
        end
        i += 1
      end

      until writes == OUTPUT_LENGTH
        buffer << '0'
        writes += 1
      end
    end
  end
end
