# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git_branch_cleaner/version'

Gem::Specification.new do |gem|
  gem.name          = "git_branch_cleaner"
  gem.version       = GitBranchCleaner::VERSION
  gem.authors       = ["dreamfall"]
  gem.email         = ["amarant.st@gmail.com"]
  gem.description   = %q{Deletes remote branches merged in origin/master}
  gem.summary       = %q{Deletes remote branches merged in origin/master}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
