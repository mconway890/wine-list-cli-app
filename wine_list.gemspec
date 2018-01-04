# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wine_list/version'

Gem::Specification.new do |spec|
  spec.name          = "wine_list"
  spec.version       = WineList::VERSION
  spec.date          = '2017-11-04'
  spec.authors       = ["Michele Conway"]
  spec.email         = ["'mconway890@gmail.com'"]

  spec.summary       = %q{Daily Wine Picks, Top Wines of the Year}
  spec.description   = %q{Wine List can show you todays top wines as well as the top wines of the current year.}
  spec.files         = ["lib/wine_list.rb"]
  spec.homepage      = "https://github.com/mconway890/wine-list-cli-app"
  spec.license       = "MIT"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
