require 'overcommit/utils'

module Overcommit
  # Get configuration options from git
  module GitConfig
    module_function

    def comment_character
      char = `git config --get core.commentchar`.chomp
      char = '#' if char == ''
      char
    end

    def hooks_path
      path = `git config --get core.hooksPath`.chomp
      return File.join(Overcommit::Utils.repo_root, '.git', 'hooks') if path.empty?
      File.absolute_path(path)
    end
  end
end
