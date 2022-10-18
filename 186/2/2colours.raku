#!/usr/bin/env raku

sub makeover($_) { .samemark('a') }

my $str = 'ÃÊÍÒÙ';
$str.&makeover.say;
