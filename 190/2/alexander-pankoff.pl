#!/usr/bin/env perl
use v5.36;

use List::Util qw(reduce max);
use Test::More tests => 3;

is_deeply( [ decoded_list(11) ],   [qw'AA K'],                'Example 1' );
is_deeply( [ decoded_list(1115) ], [qw'AAAE AAO AKE KAE KO'], 'Example 2' );
is_deeply( [ decoded_list(127) ],  [qw'ABG LG'],              'Example 3' );

sub decoded_list ($encoded) {
    my $offset = ord('A') - 1;
    return map {
        join( '', map { chr( $_ + $offset ) } @$_ )
    } possible_decodings($encoded);
}

sub possible_decodings ( $str, $cur = 0, $acc = [] ) {
    return ($acc) if $cur >= length $str;
    my @decodings =
      possible_decodings( $str, $cur + 1, [ @$acc, substr( $str, $cur, 1 ) ] );

    my $next_two = substr( $str, $cur, 2 );

    if ( length $next_two == 2 && $next_two <= 26 ) {
        push @decodings,
          possible_decodings( $str, $cur + 2, [ @$acc, $next_two ] );
    }

    return @decodings;
}
