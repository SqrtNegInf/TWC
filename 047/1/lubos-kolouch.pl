#!/usr/bin/env perl
use v5.36;

use Roman;

sub roman_magic {
    my ($v1, $op, $v2) = @_;

    my $rom_v1 = arabic($v1);
    my $rom_v2 = arabic($v2);

    return uc(roman(eval "$rom_v1 $op $rom_v2"))
}

# TESTS

my @ARGV = <V + VI>;
my ($v1, $op, $v2) = @ARGV;

print roman_magic($v1, $op, $v2)."\n";


use Test::More;

is (roman_magic('V','+','VI'),'XI');

done_testing;


