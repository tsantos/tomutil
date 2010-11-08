#!/usr/bin/env ruby

$:.unshift('..')

require 'rubygems'
require 'lib/tomutil/parallel'
require 'lib/tomutil/padder'
include TomUtil

hosts = %w[hd01 hd02 hd03 hd04 hd05 hd06 hd07 hd08 hd09 hd10]

parallel_each(hosts) do |host|
    #puts `ssh #{host} ls`
    #puts `ssh #{host} ls -l`
    prepend_exec(host + ": ",  "ssh #{host} ls")
    prepend_exec(host + ": ",  "ssh #{host} ls -l")
end

strs = %w[fred ted anthony jake ed]
padder = Padder.new(strs)

strs.each do |str|
    puts "-->#{padder.pad(str)}<--"
end

Padder.pad_list(strs).each do |str|
    puts "-->#{str}<--"
end
