#!/usr/bin/env perl
use v5.28;

use strict;
use warnings;

my @examples = ( 'aabb', 'abab', 'aaa', 'bbb');

sub b_after_a {
    my $str = shift;

    return ( $str =~ /bb|^b+$/ ? 'true' : 'false');
}

for my $element (@examples) {
    my $baa = b_after_a $element;

    printf "Input  : str = '%s'\n", $element;
    printf "Output : %s\n", $baa;
    say ' ';
}
