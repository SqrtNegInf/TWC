#!/usr/bin/env perl

use v5.36;
use experimental "for_list";

    my ($str,$chr) = ('ballerina','e');
    my $length=length $str;
    my $matches=0+grep{ lc($_) eq lc($chr)} split "", $str;
    my $percentage = int(.5+100*$matches/$length);
    say "str=$str, chr=$chr -> $percentage";
