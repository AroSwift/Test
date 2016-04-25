# -*- encoding: utf-8 -*-
# stub: spinjs-rails 1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "spinjs-rails"
  s.version = "1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dmytrii Nagirniak"]
  s.date = "2014-09-16"
  s.description = "An animated CSS3 loading spinner with VML fallback for IE."
  s.email = ["dnagir@gmail.com"]
  s.homepage = "https://github.com/dnagir/spinjs-rails"
  s.licenses = ["MIT"]
  s.rubyforge_project = "spinjs-rails"
  s.rubygems_version = "2.4.5"
  s.summary = "A spinning activity indicator for Rails 3 with no images and CSS."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.1"])
    else
      s.add_dependency(%q<rails>, [">= 3.1"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.1"])
  end
end
