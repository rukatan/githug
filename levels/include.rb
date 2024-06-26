difficulty 2
description "Notice a few files with the '.a' extension. We want git to ignore all the files except the 'lib.a' file."

setup do
  repo.init
  FileUtils.touch("first.a")
  FileUtils.touch("second.a")
  FileUtils.touch("lib.a")
  system "git branch -m master"
  file = File.open(".git/config", "w") do |file|
    file.puts "[core]\nexcludesfile="
  end
end

solution do
  entries = File.readlines('.gitignore').map(&:chomp)
  entries.include? '*.a' and entries.include? '!lib.a'
end

hint do
  puts "Using `git help ignore`, read about the optional prefix to negate a pattern."
end
