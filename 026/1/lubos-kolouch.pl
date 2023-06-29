#!/usr/bin/env perl
use v5.36;

sub get_common_chars {
    my ( $word1, $word2 ) = @_;

    my $count = 0;
    for ( split //, $word1 ) {
        $count++ if $word2 =~ /$_/msx;
    }

    return $count;
}


#say get_common_chars(@ARGV);

# TESTS
use Test::More;

is( get_common_chars( 'chancellor', 'chocolate' ), 8 );
is( get_common_chars( 'chancellor', 'chocolat' ),  7 );
is( get_common_chars( 'abcde',      'fghi' ),      0 );

done_testing;
