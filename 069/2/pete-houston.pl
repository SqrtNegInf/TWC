#!/usr/bin/env perl
use v5.36;

my $str = '';
my $n  = shift @ARGV // 7;
$str    = $str . '0' . switch (scalar reverse $str) for 1 .. $n;

print "String $n is $str\n";

sub switch {
    (my $x = shift) =~ y/01/10/;
    return $x;
}
