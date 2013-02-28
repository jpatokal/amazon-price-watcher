#!/usr/bin/env ruby
require 'nokogiri'
require 'restclient'

def average(array)
  array.inject { |res,e| res += e } / array.length
end

raise "Usage: ruby amazon-price-watcher.rb year [internet-archive-snapshot-id]" unless year = ARGV.shift
snapshot = ARGV.shift unless ARGV.empty?
prices = []
puts "Year #{year}, snapshot #{snapshot}"
(1..5).each do |n|
  url = "http://www.amazon.com/gp/bestsellers/#{year}/digital-text/154606011?_encoding=UTF8&pg=#{n}"
  url = "http://web.archive.org/web/#{snapshot}/#{url}" if snapshot
  puts "Page #{n}: #{url}"
  @doc = Nokogiri::XML(RestClient.get url)
  prices += @doc.css('.zg_price .price').map(&:text).reject {|a| a == "Free"}.map { |a| a.gsub('$','').to_f }
end
puts "Prices: #{prices}"
puts "Average: #{average prices}"

prices.reject! {|a| a > 5}
puts "Under $5 prices: #{prices}"
puts "Under $5 count: #{prices.length}"
puts "Under $5 average: #{average prices}"
