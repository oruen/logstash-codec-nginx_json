Gem::Specification.new do |s|

  s.name            = 'logstash-codec-nginx_json'
  s.version         = '2.0.0'
  s.licenses        = ['Apache-2.0']
  s.summary         = "This codec may be used to decode (via inputs) and encode (via outputs) full JSON messages"
  s.description     = "This gem is a logstash plugin required to be installed on top of the Logstash core pipeline using $LS_HOME/bin/logstash-plugin install gemname. This gem is not a stand-alone program"
  s.authors         = ["Nick Recobra"]
  s.email           = 'oruenu@gmail.com'
  s.homepage        = "http://www.elastic.co/guide/en/logstash/current/index.html"
  s.require_paths = ["lib"]
  s.platform = "java"

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']

  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "codec" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core", "~> 5.2"
  s.add_runtime_dependency "logstash-codec-json", "~> 3.0"

  s.add_development_dependency "rspec", '~> 3.5'
  s.add_development_dependency 'logstash-devutils', '~> 1.3'
end
