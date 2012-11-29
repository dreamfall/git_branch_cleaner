require "git_branch_cleaner/version"
require "shellwords"
require "highline/import"

module GitBranchCleaner
  class Cleanuper
    def initialize(force)
      @force = force
    end

    def execute!
      `git fetch`
      branches = `git branch -r`.split("\n")

      branches.reject! { |branch| `git branch --contains #{branch}` =~ /master/ }
      branches.map! { |branch| [branch.split('/')[0].strip, branch.split('/')[1].strip] }

      branches.each do |remote, branch_name|
        confirmed = @force

        unless confirmed
          input = ask("Are you sure you want to delete branch #{branch_name} on remote #{remote}? (Y/n)")
          confirmed = input =~ /[Yy]/ || input.empty?
        end

        if confirmed
          `git push #{Shellwords.escape(remote)} :#{Shellwords.escape(branch_name)}`
        end
      end
    end
  end
end
