#!/usr/bin/env perl

use strict;
use warnings;

use List::Permutor;

my @n = (1,2,3,4);

if (@ARGV) {
    @n = ();
    my $argString = "@ARGV";

    my %pair = ( '[' => ']', '(' => '\)', '{' => '}', '<' => '>');
    $argString =~ s{\A\s*([[(\{<])\s*}{};
    $argString =~ s{\s*$pair{$1}\s*\Z}{} if $1;
    $argString =~ s{[, ]+}{ }g;

    foreach (split m{ }, $argString) {
        if ($_ =~ m{\d+}) {
            push @n, $_;
        } else {
            print STDERR "Non-numeric input detected.\n";
            exit(1);
        }
    }

} else {
    #print STDERR "No arguments given. Using example data: [1, 2, 3, 4]\n";
}

my $perm = new List::Permutor @n;

ARRAY_LOOP:
while (my @set = $perm->next) {
    my $prev;

    ITEM_LOOP:
    for (my $i = 0; $i <= $#set; ++$i) {
        next ITEM_LOOP if $i == 0;

        if ($i % 2 == 0) {      # EVEN
            next ARRAY_LOOP if $set[$i-1] > $set[$i];
        } else {                # ODD
            next ARRAY_LOOP if $set[$i-1] < $set[$i];
        }
    }

    print "$_ " foreach @set;
    print "\n";
}
