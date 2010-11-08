#!/usr/bin/env ruby

$:.unshift('..')

require 'rubygems'
require 'lib/tomutil/parallel'
require 'lib/tomutil/padder'
include TomUtil

hosts = %w[h01 h02 h03 h04 h05 h06 h07 h08 h09 h10]

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
