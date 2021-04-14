require 'json'

package = JSON.parse(File.read(File.join(__dir__, '../package.json')))

Pod::Spec.new do |s|
  s.name          = 'RNVideoCache'
  s.version       = package['version']
  s.summary       = package['description']
  s.description   = package['description']
  s.license       = package['license']
  s.authors       = { 'Kyle Fang' => 'zhigang1992@gmail.com' }
  s.homepage      = package['homepage']
  s.source        = { :git => package['homepage'] }

  s.requires_arc  = true
  s.platform      = :ios, '8.0'
  s.source_files  = 'RNVideoCache.{h,m}'
  s.dependency 'KTVHTTPCache', '~> 2.0.0'
  s.dependency "React"
end
