amazon-price-watcher
====================

Dinky little script to compute average prices from historical or current Amazon Kindle Top 100 E-Books lists.  Likely to break when Amazon decides to tweak its page designs.

Requires Nokogiri, RestClient.

Usage
====

````
ruby amazon-price-watcher.rb year [internet-archive-snapshot-id]
````

Examples
========

````
% ruby amazon-price-watcher.rb 2013
````
Average price of 2013 bestsellers (so far)

````
% ruby amazon-price-watcher.rb 2011 20120108055557
````
Average price of 2011 bestsellers, using Internet Archive's snapshot at 20120108055557
(Browse http://web.archive.org/web/*/http://www.amazon.com/gp/bestsellers/2011/digital-text/154606011 to find snapshot dates)
