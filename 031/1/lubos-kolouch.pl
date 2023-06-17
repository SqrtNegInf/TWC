#!/usr/bin/env perl
use v5.36;

use Try::Tiny;

sub divide_test {
    my ( $num, $div ) = @_;

    my $result;

    try {
        $result = $num / $div;
    }
    catch {
        $result = "ERROR";
    }
    finally {
        return $result;
    }
}

# TESTS
use Test::More;

is(divide_test( 0,0 ),"ERROR");
is(divide_test( 1,0 ),"ERROR");
isnt(divide_test( 1,1 ),"ERROR");

done_testing;
