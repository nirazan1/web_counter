require 'open-uri'
require 'pry'
require 'nokogiri'

class WebCounter
  LETTER_COUNT_BASE_URL = 'https://www.reuters.com'
  WORD_COUNT_BASE_URL = 'https://developer.github.com/v3/#http-redirects'
  ELEMENT_COUNT_BASE_URL = 'https://www.yourlocalguardian.co.uk/sport/rugby/rss'
  BASE_DIVIDER = 100

  def self.letter_count(letter, url=LETTER_COUNT_BASE_URL)
    puts "getting count of letter #{letter} in site #{url}"
    texts(url).join('').scan(/\w/)
              .inject(Hash.new(0)){|h, c| h[c] += 1; h}[letter.downcase]/BASE_DIVIDER
  end

  def self.word_count(word, url=WORD_COUNT_BASE_URL)
    puts "getting count of word #{word} in site #{url}"
    id = url.split('#').last
    page = html(url)
    start_element = page.at_css("[id=#{id}]").parent
    start_element_index = page.search('h2').to_enum.with_index
                              .find{|node| node.first == start_element }
                              .last
    end_element_index = start_element_index+1
    words = page.xpath("//*[preceding-sibling::h2[#{start_element_index}]]"\
                       "[following-sibling::h2[#{end_element_index}]]")
                .map(&:content).join('').scan(/\w+/).map(&:downcase)
    words.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1}[word.downcase]
  end

  def self.all_page_word_count(word, url=WORD_COUNT_BASE_URL)
    puts "getting count of word #{word} in site #{url}"
    texts(url).each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1}[word.downcase]
  end

  def self.element_count(element, url=ELEMENT_COUNT_BASE_URL)
    puts "getting count of element #{element} in site #{url}"
    html(url).css(element.downcase).count
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
