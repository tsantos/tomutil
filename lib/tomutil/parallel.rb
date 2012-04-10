
require 'thread'
require 'open3'

module TomUtil
   # Runs the block for each item in list
   def parallel_each(list, &block)
     list.map {|i| Thread.new {block.call(i)}}.each {|t| t.join}
   end
   
   # Returns an Array of threads
   def launch_threads num_threads, &block
     num_threads.times.map {Thread.new(block)}
   end
  
   # Lets you prepend a string to the output lines
   # of the exec.
   def prepend_exec(str, cmd)
      Open3.popen3(cmd) do |stdin, stdout, stderr|
         while true
            begin
               puts "#{str}#{stdout.readline}"
            rescue
               break
            end
         end
      end
   end
end

# vim: filetype=ruby tabstop=3 expandtab 
