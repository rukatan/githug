difficulty 1
description "There is a file in your folder called `README`; add it to your staging area.
Note: Each level starts with a new repo. Don't look for files of the previous one."

setup do
  repo.init
  FileUtils.touch("README")
  system "git branch -m master"
end

solution do
  return false unless repo.status.files.keys.include?("README")
  return false if repo.status.files["README"].untracked
  true
end

hint do
  puts "You can type `git` in your shell to get a list of available git commands."
end
