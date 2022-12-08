# frozen_string_literal: true

require_relative "./command"

module Hadron
  class CommandLine
    def initialize
      @commands = {}
    end

    def command(name, &block)
      cmd = Command.new(name)
      cmd.instance_eval(&block)
      @commands[name] = cmd
    end

    def run(args)
      cmd_name = args.shift
      cmd = @commands[cmd_name]

      if cmd
        cmd.run(args)
      else
        puts "Unknown command: #{cmd_name}"
      end
    end
  end
end
