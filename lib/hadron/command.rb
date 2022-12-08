# frozen_string_literal: true

module Hadron
  class Command
    def initialize(name)
      @name = name
      @subcommands = {}
    end
  
    def desc(description)
      @description = description
    end
  
    def arg_name(name)
      @arg_name = name
    end
  
    def action(&block)
      @action = block
    end
  
    def command(name, &block)
      cmd = Command.new(name)
      cmd.instance_eval(&block)
      @subcommands[name] = cmd
    end
  
    def run(args)
      if @subcommands.empty?
        # This command has no subcommands, so it must have an action
        @action.call(args)
      else
        # This command has subcommands, so the next argument should be a subcommand name
        subcmd_name = args.shift
        subcmd = @subcommands[subcmd_name]
  
        if subcmd
          subcmd.run(args)
        else
          puts "Unknown subcommand for '#{@name}': #{subcmd_name}"
        end
      end
    end
  end
end
