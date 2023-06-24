#!/usr/bin/env perl
use v5.36;

my $c;
print "Perl Weekly Challenge" =~ s/e(?{$c++})/E/gr . ", E=$c\n";
