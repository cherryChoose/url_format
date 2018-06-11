# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "url_format/version"

Gem::Specification.new do |spec|
  spec.name          = "url_format"
  spec.version       = UrlFormat::VERSION
  spec.authors       = ["cherrymay"]
  spec.email         = ["cherrymay@aliyun.com"]

  spec.summary       = %q{format url reg}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/cherryChoose/utl_format"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = ""
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  # Simple in-memory database using ActiveModel.
  spec.add_development_dependency "supermodel"

end
