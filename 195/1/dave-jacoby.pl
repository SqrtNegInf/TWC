#!/usr/bin/env perl

use v5.36;

my @examples = ( 15, 35, 1000 );
for my $n (@examples) {
    my $o = special_list($n);
    say <<"END";
    Input:  \$n = $n
    Output: $o
END
}

sub special_list ( $n ) {
    return scalar grep { is_special($_) } 1 .. $n;
}

sub is_special ( $n ) {
    my %hash;
    for my $i ( split //, $n ) {
        return 0 if ++$hash{$i} > 1;
    }
    return 1;
}
