Pod::Spec.new do |s|
s.name = 'Analyst'
s.version = '0.1.0'
s.license = 'MIT'
s.summary = 'A/B testing done right.'
s.homepage = 'https://github.com/junkpiano/Analyst'
s.social_media_url = 'http://twitter.com/junkpiano'
s.authors = { 'Yusuke Ohashi' => 'steveohashi@gmail.com' }
s.source = { :git => 'https://github.com/junkpiano/Analyst.git', :tag => s.version }
s.documentation_url = 'https://junkpiano.github.io/Analyst/'

s.ios.deployment_target = '8.0'
s.osx.deployment_target = '10.10'
s.tvos.deployment_target = '9.0'
s.watchos.deployment_target = '2.0'

s.source_files = 'Sources/**/*.swift'
end
