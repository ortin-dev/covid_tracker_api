# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'covid_tracker_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'covid_tracker_api'
  spec.version       = CovidTrackerApi::VERSION
  spec.authors       = ['Vlad']
  spec.email         = ['vlad.ortin@cybergizer.com']

  spec.summary       = 'Covid19 Tracker'
  spec.description   = 'Corona Virus Statistics API. All statistics data and cases along with confirmed, recovered and deaths from all around the world.'
  spec.homepage      = 'https://github.com'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"

    spec.metadata['homepage_uri'] = spec.homepage
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'httparty'
end
