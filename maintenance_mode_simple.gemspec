# frozen_string_literal: true

require_relative "lib/maintenance_mode_simple/version"

Gem::Specification.new do |spec|
  spec.name = "maintenance_mode_simple"
  spec.version = MaintenanceModeSimple::VERSION
  spec.authors = ["bogdancojan"]
  spec.email = ["tt1397894@gmail.com"]

  spec.summary = "Designed to manage the maintenance mode of your Rails application."
  spec.homepage = "https://github.com/bogdancojan/Maintenance-Mode"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bogdancojan/Maintenance-Mode"
  spec.metadata["changelog_uri"] = "https://github.com/bogdancojan/Maintenance-Mode/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.21"
end
