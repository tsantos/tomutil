
require 'fileutils'

module TomUtil
  class WD
    def self.pushd path, &block
      Thread.current[:wd_stack] = [] unless Thread.current[:wd_stack]
      Thread.current[:wd_stack].push pwd
      FileUtils.cd path
      begin
        block.call
      ensure
        cd Thread.current[:wd_stack].pop
      end
    end
  end
end

