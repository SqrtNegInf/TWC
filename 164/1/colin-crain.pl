#!/usr/bin/env perl
use v5.36;

my $input = shift @ARGV // 1000;

sub sieve ($limit) {
    my @s = (1) x $limit;
    @s[0,1] = (0,0);    
    for my $f (2..sqrt($limit)) {    
        $s[$f * $_] = 0 for $f..$limit/$f;
    }
    return grep { $s[$_] } (0..$limit);
}

say $_ for grep { /^(.*).?(??{reverse($1)})$/ } sieve($input);






