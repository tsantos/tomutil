
require 'thread'
require 'open3'

module TomUtil
   # Runs the block for each item in list
   def parallel_each(list, &block)
      threads = []

      list.each do |item|
         threads << Thread.new do
            if block_given? then yield(item); end
         end
      end

      threads.each do |thread|
         begin
            thread.join
         rescue
         end
      end
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

   # Lets you pass in a string that has some numeric ranges specified.
   # It will create a list of strings with the ranges played out.
   # host-(9..11) will make ['host-09', 'host-10', 'host-11]
   # If you want to force padding, the last argument specifies it.
   def expand_nums(str, pad = -1)
      str =~ /(.*?)(\(\d+.{2,3}\d+\))(.*)/
      range = nil
      procs = [$1, $2, $3].map do |part|
         if part =~ /^\(/ # Starts with paren
            begin
               range = eval(part)
               lambda {|str| str}
            rescue
               lambda {|str| part}
            end
         else
            lambda {|str| part}
         end
      end

      if range
         nums = range.to_a
         if pad == -1
            pad = nums[nums.length - 1].to_s.length
         end
         strs = nums.map {|n| sprintf("%.#{pad}d", n) }
         strs.map do |str|
            result = ""
            procs.each do |proc|
               result << proc.call(str)
            end
            result
         end
      else
         [str]
      end
   end
end

# vim: filetype=ruby tabstop=3 expandtab 
