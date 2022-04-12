#!/usr/bin/env perl
use strict;
use warnings;
use feature qw/say/;

my ($int) = 55;
die "$int isn't an int! \n" if $int =~ /\D/;

for (my $i = 2;;$i++){
    my $bin = sprintf("%b", $i);
    next if $bin == $int;

    # we know it starts with 1, but make sure there's at least one 0
    next unless $bin =~ /0+/;

    say "$bin is the smallest multiple of $int with 1s *and* 0s."
	and last
	unless $bin % $int;
}
