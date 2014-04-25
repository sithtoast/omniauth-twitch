Gem::Specification.new do |gem|
  gem.authors  = ["William Holt"]
  gem.email  = ["william@webtheory.io"]
  gem.description = %q{OmniAuth Strategy for Twitch.tv.}
  gem.summary = %q{Omniauth Strategy for Twitch.tv.}
  gem.homepage = "https://github.com/sithtoast/omniauth-twitch"

  gem.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files =  `git ls-files`.split("\n")
  gem.name = "omniauth-twitch"
  gem.require_path = ["lib"]
  gem.version = "0.0.1"

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
end
