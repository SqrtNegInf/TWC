#!/usr/bin/env perl
use v5.36;

use Test::More;

sub h_index {
    my @citations        = @_;
    my $n                = scalar @citations;
    my $h                = 0;
    my @sorted_citations = sort { $b <=> $a } @citations;

    for ( my $i = 0 ; $i < $n ; $i++ ) {
        if ( $sorted_citations[$i] >= $i + 1 ) {
            $h = $i + 1;
        }
        else {
            last;
        }
    }
    return $h;
}

# Run the tests
my @citations_1 = ( 10, 8, 5, 4, 3 );
my $h_index_1   = h_index(@citations_1);
is( $h_index_1, 4, "Test Example 1" );

my @citations_2 = ( 25, 8, 5, 3, 3 );
my $h_index_2   = h_index(@citations_2);
is( $h_index_2, 3, "Test Example 2" );

done_testing();
