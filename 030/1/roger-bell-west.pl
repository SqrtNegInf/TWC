#!/usr/bin/env perl
use v5.36;

use Time::Local;

print map {"$_\n"} grep {(gmtime(timegm(0,0,12,25,11,$_)))[6]==0} (2019..2100);
