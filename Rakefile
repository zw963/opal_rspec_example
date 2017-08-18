# 注意, 在新版本的 Rakefile 中, 我们不再需要下面的两行:
# 相反, 如果使用了下面的两行, 会报错. LoadError: cannot load such file -- rake
require 'bundler'
Bundler.require

require 'opal/rspec/rake_task'
Opal::RSpec::RakeTask.new(:default) do |server, task|
  # 如果需要完全改写 load paths, 使用 task.default_path = 'spec/javascripts'
  # 奇怪, 这里是 task, 而不是 server!
  server.append_path 'lib'
  task.runner = :node
end
