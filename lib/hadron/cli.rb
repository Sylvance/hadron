# frozen_string_literal: true

require "thor"
require "fileutils"

module Hadron
  class Cli < Thor
    desc "create PROJECT_NAME", "Creates a new gRPC Ruby server project with the given name"
    def create(project_name)
      # Create the project directory
      FileUtils.mkdir_p(project_name)

      # Copy the templates to the project directory
      FileUtils.cp_r("templates/.", project_name)

      # Replace placeholders in the templates with the project name
      Dir["#{project_name}/**/*.erb"].each do |template_path|
        template = File.read(template_path)
        result = ERB.new(template).result(binding)
        File.write(template_path.sub(/\.erb\z/, ""), result)
        File.delete(template_path)
      end
    end
  end
end
