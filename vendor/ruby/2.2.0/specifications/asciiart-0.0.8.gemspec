# -*- encoding: utf-8 -*-
# stub: asciiart 0.0.8 ruby lib

Gem::Specification.new do |s|
  s.name = "asciiart"
  s.version = "0.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["nodanaonlyzuul", "rosscooperman"]
  s.date = "2014-07-15"
  s.email = ["stephen@eastmedia.com"]
  s.executables = ["asciiart"]
  s.files = ["bin/asciiart"]
  s.homepage = "https://github.com/nodanaonlyzuul/asciiart"
  s.rubygems_version = "2.4.5"
  s.summary = "A command line tool to turn images into ASCII art"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rmagick>, [">= 0"])
      s.add_runtime_dependency(%q<rainbow>, ["= 2.0.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<rmagick>, [">= 0"])
      s.add_dependency(%q<rainbow>, ["= 2.0.0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<rmagick>, [">= 0"])
    s.add_dependency(%q<rainbow>, ["= 2.0.0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end
