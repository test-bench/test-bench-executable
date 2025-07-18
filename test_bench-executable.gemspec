# -*- encoding: utf-8 -*-
Gem::Specification.new do |spec|
  spec.name = 'test_bench-executable'
  spec.version = '3.0.1.0'

  spec.summary = "Command line interface for TestBench"
  spec.description = <<~TEXT.each_line(chomp: true).map(&:strip).join(' ')
  #{spec.summary}.
  TEXT

  spec.homepage = 'http://test-bench.software'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/test-bench-demo/test-bench-executable'

  allowed_push_host = ENV.fetch('RUBYGEMS_PUBLIC_AUTHORITY') { 'https://rubygems.org' }
  spec.metadata['allowed_push_host'] = allowed_push_host

  spec.metadata['namespace'] = 'TestBench::Executable'

  spec.license = 'MIT'

  spec.authors = ['Brightworks Digital']
  spec.email = 'development@bright.works'

  spec.require_paths = ['lib']

  spec.files = Dir.glob('lib/**/*')

  spec.bindir = 'executables'
  spec.executables = Dir.glob('executables/*').map { |executable| File.basename(executable) }

  spec.platform = Gem::Platform::RUBY

  spec.add_runtime_dependency 'test_bench-run'

  spec.add_development_dependency 'test_bench-bootstrap'
end
