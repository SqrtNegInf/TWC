#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Test2::V0 -no_srand;

is(defranged_IP("1.1.1.1"), "1[.]1[.]1[.]1", 'Example 1');
is(defranged_IP("255.101.1.0"), "255[.]101[.]1[.]0", 'Example 2');
done_testing();

sub defranged_IP
{
     my $str = $_[0];
     $str =~ s/\./[.]/g;
     return $str;
}
