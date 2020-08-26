Gem::Specification.new do |s|
  s.name        = 'web_counter'
  s.version     = '0.0.1'
  s.date        = '2020-08-26'
  s.summary     = 'Web page scrapper'
  s.description = 'Scraps web page and returns number of letter word or element.'
  s.author      = 'Nirajan Pokhare'
  s.email       = 'nirazan@nirazan.com.np'
  s.files       = ['lib/web_counter.rb']
  s.add_development_dependency 'rspec', '~> 3.9.0'
  s.add_development_dependency "nokogiri"
  s.add_development_dependency "pry"
  s.homepage    =
    'http://rubygems.org/gems/web_counter'
  s.license       = 'MIT'
end
