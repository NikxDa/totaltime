GEM_NAME = "totaltime"
GEM_VERSION = "0.1.3"

task :default => :build

task :build do
  system "gem build " + GEM_NAME + ".gemspec"
end

task :install => :build do
  system "gem install " + GEM_NAME + "-" + GEM_VERSION + ".gem"
end

task :publish => :build do
  system 'gem push ' + GEM_NAME + "-" + GEM_VERSION + ".gem"
  system 'gem push --key github --host https://rubygems.pkg.github.com/NikxDa ' + GEM_NAME + "-" + GEM_VERSION + ".gem"
end

task :clean do
  system "rm *.gem"
end

task :test do
  system "ruby test/ts_all.rb"
end