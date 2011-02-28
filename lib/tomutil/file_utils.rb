
require 'fileutils'
include FileUtils

module TomUtil
  class WD
    def self.pushd path, &block
      # Ensure this thread has a stack
      unless Thread.current[:stack]
        Thread.current[:stack] = []
      end

      Thread.current[:stack].push pwd
      cd path
      begin
        block.call
      ensure
        cd Thread.current[:stack].pop
      end
    end
  end
end

