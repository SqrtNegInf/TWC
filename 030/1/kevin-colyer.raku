#!/usr/bin/env raku

use Test;

my @sundayxmas;

2019..2100 ==> map { Date.new($_,12,25) } ==> grep { $_.day-of-week==7} ==> map { say $_.yyyy-mm-dd } ;
