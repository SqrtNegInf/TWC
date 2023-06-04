#!/usr/bin/env perl
use v5.36;

my @A;

if ($ARGV[0]) {@A = @ARGV;} else {@A = (9, 10, 7, 5, 6, 1);}
my @ans = ();

my @CA = @A;
my $max = -10000;

for (reverse @CA) {
    my $s = pop @CA;
    if ($s > $max) {
        unshift @ans, $s;
        $max = $s;
    }
}



print "original list:\n";
print join ",", @A;
print "\n";

print "\nleader elements:\n";
print join ",", @ans;
print "\n";
