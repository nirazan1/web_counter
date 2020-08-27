# web_counter
Gets count of letter, word or element from URLs

Installation Step

1. Clone the repo `git clone https://github.com/nirazan1/web_counter.git`
2. Goto to cloned directory `cd web_counter` 
3. Build the gem from `gem build web_counter.gemspec`
4. Install gem `gem install web_counter-0.0.1.gem`

Usage

1. Open `irb` in terminal
2. require them gem `require 'web_counter'`
3. Execute methods

```
─nirazan at local in ~/Documents/web_counter on master✘✘✘ using ‹ruby-2.6.0› 20-08-27 - 21:22:40
╰─⠠⠵ gem build web_counter.gemspec
  Successfully built RubyGem
  Name: web_counter
  Version: 0.0.1
  File: web_counter-0.0.1.gem
╭─nirazan at local in ~/Documents/web_counter on master✘✘✘ using ‹ruby-2.6.0› 20-08-27 - 21:22:45
╰─⠠⠵ gem install web_counter-0.0.1.gem
Successfully installed web_counter-0.0.1
1 gem installed
╭─nirazan at local in ~/Documents/web_counter on master✘✘✘ using ‹ruby-2.6.0› 20-08-27 - 21:22:55
╰─⠠⠵ irb
2.6.0 :001 > require 'web_counter'
 => true
2.6.0 :002 > WebCounter.letter_count('a')
getting count of letter a in site https://www.reuters.com
 => 49
2.6.0 :003 > WebCounter.word_count('status')
getting count of word status in site https://developer.github.com/v3/#http-redirects
 => 2
2.6.0 :004 > WebCounter.element_count('pubDate')
getting count of element pubDate in site https://www.yourlocalguardian.co.uk/sport/rugby/rss
 => 51
```

