#!/usr/bin/env perl
use v5.36;

sub isLeader {
    my ($n, @arr) = @_;

    for my $elem (@arr) {
        if ($n <= $elem) {
            return undef;
        } 
    }

    return 1;
}

my @ARGV = <9 10 7 5 6 1>;
my $l = scalar @ARGV - 1;
say join q{, },
   @ARGV[ grep {  isLeader($ARGV[$_], @ARGV[($_ + 1) .. $l]) } 0 .. $l ];
