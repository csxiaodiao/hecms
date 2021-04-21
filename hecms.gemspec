# frozen_string_literal: true

require_relative 'lib/hecms/version'

Gem::Specification.new do |spec|
  spec.name        = 'hecms'
  spec.version     = Hecms::VERSION
  spec.authors     = ['csxiaodiao']
  spec.email       = ['i@xiaodiao.me']
  spec.homepage    = 'http://xiaodiao.me'
  spec.summary     = 'Hecms.'
  spec.description = 'Hecms.'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'activestorage-aliyun', '~> 0.6.4'
  spec.add_dependency 'acts_as_tenant', '~> 0.5.0'
  spec.add_dependency 'awesome_nested_set', '~> 3.4'
  spec.add_dependency 'devise', '~> 4.7', '>= 4.7.3'
  spec.add_dependency 'enumerize', '~> 2.3', '>= 2.3.1'
  spec.add_dependency 'fomantic-ui-sass', '~> 2.8', '>= 2.8.7'
  spec.add_dependency 'friendly_id', '~> 5.4', '>= 5.4.2'
  spec.add_dependency 'jquery-rails', '~> 4.4'
  spec.add_dependency 'kaminari', '~> 1.2', '>= 1.2.1'
  spec.add_dependency 'mini_magick', '~> 4.9', '>= 4.9.3'
  spec.add_dependency 'pry'
  spec.add_dependency 'rails', '~> 6.1.3', '>= 6.1.3.1'
  spec.add_dependency 'ransack', '~> 2.4', '>= 2.4.2'
  spec.add_dependency 'sass-rails', '>= 6'
end
