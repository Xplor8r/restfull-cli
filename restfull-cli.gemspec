
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rest_full/version"

Gem::Specification.new do |spec|
  spec.name          = "restfull-cli"
  spec.version       = Restfull::Cli::VERSION
  spec.authors       = ["Michael Pieschel"]
  spec.email         = ["sixtyhectares@yahoo.com"]

  spec.summary       = "Find a top restaurant in LA."
  spec.description   = "Rest Full LA is the app that helps the restless and empty in LA to Rest Full in LA!"
  spec.homepage      =  "https://github.com/Xplor8r/restfull-cli"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
