require 'bundler'
Bundler.require
require 'opal/rspec/rake_task'

Opal::RSpec::RakeTask.new(:default) do |server, task|
  # 如果需要完全改写 load paths, 使用 task.default_path = 'spec/javascripts', 奇怪, 这里是 task, 而不是 server!
  server.append_path 'lib'
  server.append_path 'node_modules'
  task.runner = :chrome
  # task.timeout = 5000          # 修改 phantomjs timeout 时间, 有时候运行失败, 需要等很久才能退出.
end
