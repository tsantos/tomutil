
require 'fileutils'
include FileUtils

module TomUtil
  
  # WTF is this?  I clearly hadn't the foggiest.  Noob.
  # I'm not deleting this ATM because there's probably
  # some sorry-ass code out there that depends on it.
  class WD
    def self.pushd path, &block
      puts "*** WD.pushd is worthless!"
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

