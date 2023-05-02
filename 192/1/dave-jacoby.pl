#!/usr/bin/env perl

use v5.36;

my @input = 1 .. 20;

{ use bigint; say binary_flip(2**64 +1); } # wrong

for my $i (@input) {
    my $output = binary_flip($i);
    say <<"END";
        Input:  \$s = $i
        Output: $output
END
}

sub binary_flip ( $input ) {
    my $pos = sprintf '%b', $input;
    my $neg = '';
    for my $i ( 0 .. -1 + length $pos ) {
        my $p = substr( $pos, $i, 1 );
        my $n = $p == 1 ? 0 : 1;
        substr( $neg, $i, 1 ) = $n;
    }
    my $flip = bin2dec($neg);
    # say join " ", $input, $pos, '', $neg, $flip;
    return $flip;
}

# Perl Cookbook
sub bin2dec {
    return unpack( "N", pack( "B32", substr( "0" x 32 . shift, -32 ) ) );
}
