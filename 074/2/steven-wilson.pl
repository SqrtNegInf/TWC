#!/usr/bin/env perl

use strict;
no warnings;
use feature qw/ say /;
use List::MoreUtils qw/ first_index /;
use Test::More;

my $string1_test = 'ababc';
my $string2_test = 'xyzzyx';
ok( first_non_repeating_characters($string1_test) eq 'abb#c',
    "test \'$string1_test\'" );
ok( first_non_repeating_characters($string2_test) eq 'xyzyx#',
    "test \'$string2_test\'" );
done_testing();

say first_non_repeating_characters($string1_test);
say first_non_repeating_characters($string2_test);

sub first_non_repeating_characters {
    my $string = shift;
    my @non_repeating;
    my @repeating;
    my $result;
    for my $char ( split //, $string ) {
        my $in_repeating     = grep { $_ eq $char } @repeating;
        my $in_non_repeating = grep { $_ eq $char } @non_repeating;
        if ($in_non_repeating) {
            my $index = first_index { $_ eq $char } @non_repeating;
            splice @non_repeating, $index, 1;
            push @repeating, $char;
        }
        elsif ( !$in_repeating && !$in_non_repeating ) {
            push @non_repeating, $char;
        }
        scalar @non_repeating > 0
          ? ( $result .= $non_repeating[-1] )
          : ( $result .= qw/ # / );
    }
    return $result;
}

