#!/usr/bin/env perl
use v5.36;

my @string = ("Perl", "Python", "Pascal");
my $chk = "ppp";

print $chk eq join('', map { lc( substr($_, 0, 1) ) } @string ) ? "True" : "False";

