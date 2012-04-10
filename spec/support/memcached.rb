RSpec.configure do |config|
  config.before :suite do
    pid = IO.popen('memcached -p 19122').pid
    at_exit{ Process.kill('TERM', pid) }
  end
end
