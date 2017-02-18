# -*- encoding: utf-8 -*-
# stub: should_not 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "should_not"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mark Rushakoff"]
  s.date = "2014-10-01"
  s.description = "  You should_not start your specs with the string \"should\".\n  If every spec starts with \"should\", then it's redundant everywhere.\n\n  Instead, write in an active tone:\n  `it \"should ignore nil elements\"` - BAD\n  `it \"ignores nil elements\"` - GOOD\n"
  s.email = ["mark.rushakoff@gmail.com"]
  s.homepage = "https://github.com/should-not/should_not"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Fail specs that start with should."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<minitest>, ["~> 5.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<minitest>, ["~> 5.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<minitest>, ["~> 5.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
  end
end
