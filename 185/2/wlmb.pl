#!/usr/bin/env perl

use v5.36;

for(('ab-cde-123', '123.abc.420', '3abc-0010.xy')){
    my $n=0;
    say "$_ -> ", join "", map {$n<4 && ($n+=s/[A-Za-z0-9]/x/); $_} split ""
}
