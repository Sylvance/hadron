# frozen_string_literal: true

Dir[File.join(__dir__, "hadron", "*.rb")].sort.each { |file| require file }

module Hadron
  class Error < StandardError; end
end
