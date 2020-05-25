require "text"
require "benchmark"
require "../src/soundx.cr"

puts "Benchmarking ..."

long_word = "Schwarzenegger"
Benchmark.ips do |x|
  x.report("Text::Soundex (long word)") { Text::Soundex.soundex(long_word) }
  x.report("Soundx (long word)") { Soundx.encode(long_word) }
end

puts

short_word = "boB"
Benchmark.ips do |x|
  x.report("Text::Soundex (short word)") { Text::Soundex.soundex(short_word) }
  x.report("Soundx (short word)") { Soundx.encode(short_word) }
end

insanity = "[laksjd-9buhio3j2k6l2n3m!,nsoib08f-****i4jpinlj2-9u0h3bsuahibhkl"
Benchmark.ips do |x|
  x.report("Text::Soundex (nonsense string)") { Text::Soundex.soundex(insanity) }
  x.report("Soundx (nonsense string)") { Soundx.encode(insanity) }
end
