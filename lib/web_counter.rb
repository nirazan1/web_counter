require 'open-uri'
require 'pry'
require 'nokogiri'

class WebCounter
  LETTER_COUNT_BASE_URL = 'https://www.reuters.com'
  BASE_DIVIDER = 100

  def self.letter_count(letter, url=LETTER_COUNT_BASE_URL)
    texts(url).join('').scan(/\w/).inject(Hash.new(0)){|h, c| h[c] += 1; h}[letter.downcase]/BASE_DIVIDER
  end

  def self.word_count
    return 'Ok'
  end

  def self.element_count
    return 'Ok'
  end

  private

  def self.texts(url)
    texts = html(url).xpath('.//text() | text()').map(&:inner_text).join(' ')
    texts.scan(/\w+/).map(&:downcase)
  end

  def self.html(url)
    Nokogiri::HTML(open(url))
  end

end
