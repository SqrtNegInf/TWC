#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use Math::Int2Base qw( int2base base2int );

my $num = 3;

if ($num < 1 or $num > 5) {
    print STDERR "Invalid choice. Argument should be 1 <= n <= 5\n";
    exit(1);
}

my @vowels = qw{ a e i o u };
my $MAX = '4' x $num;

my $j = 0;
for (my $i = 0; $j <= $MAX; ++$i) {
    $j = int2base($i,5);
    $j = sprintf "%0${num}d", $j;
    my $string;
    foreach (split(//,$j)){
        $string .= $vowels[$_];
    }
    if ( $string =~ m{a[^ei]}
        or $string =~ m{e[^i]}
        or $string =~ m{i[^aeou]}
        or $string =~ m{o[^au]}
        or $string =~ m{u[^oe]} ){
        next;
    } else {
        print "$string\n";
    }
}
