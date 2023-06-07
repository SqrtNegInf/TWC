#!/usr/bin/env perl
use v5.36;

use Test::More;

is (s_thousand(''),            '0',      'Test: Empty string');
is (s_thousand('0'),         '001',      'Test: 0');
is (s_thousand('001'),   '0010011',      'Test: 001');
done_testing();

# s1000
sub s_thousand {
    my $string = shift;
    return $string . "0" . s_switch(scalar reverse($string));
}

# Switch
sub s_switch {
    my $string = shift;
    $string =~ tr/01/10/;
    return $string;
}
