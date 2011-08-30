# vi:ft=

use strict;
use warnings;

use t::PhpUtils;
plan tests => 1 * blocks();

run_tests();

__DATA__

=== TEST 1: good IP address
--- lua
local u = require "php.utils"
local n = u.ip2long("10.32.236.4")
print(n)
print(u.long2ip(n))
--- out
169929732
10.32.236.4



=== TEST 2: bad IP address
--- lua
local u = require "php.utils"
local n = u.ip2long("1000.32.236.4")
print(n)
print(u.long2ip(n))
--- out
nil
nil

