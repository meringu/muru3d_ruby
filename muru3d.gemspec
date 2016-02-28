# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'muru3d/version'

Gem::Specification.new do |spec|
  spec.name          = 'muru3d'
  spec.version       = Muru3d::VERSION
  spec.authors       = ['Henry Muru Paenga']
  spec.email         = ['meringu@gmail.com']
  spec.license       = 'Apache 2.0'

  spec.summary       = %q{3D modeler.}
  spec.description   = %q{3D modeler.}
  spec.homepage      = 'https://github.com/meringu/muru3d'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport', '~> 4.2'
  spec.add_runtime_dependency 'glu', '~> 8.2'
  spec.add_runtime_dependency 'glut', '~> 8.2'
  spec.add_runtime_dependency 'gosu', '~> 0.10.5'
  spec.add_runtime_dependency 'opengl', '0.10.0.pre1'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
