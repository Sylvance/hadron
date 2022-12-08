# frozen_string_literal: true

Dir[File.join(__dir__, "hadron", "*.rb")].sort.each { |file| require file }

module Hadron
  class Error < StandardError; end

  def self.create_project(name)
    puts "Creates project #{name}"
  end

  def self.create_database
    puts "Creates database"
  end

  def self.migrates_database
    puts "Migrates database"
  end

  def self.generate_scaffold(name)
    puts "Generates scaffold #{name}"
  end
end
