#!/usr/bin/env perl
use v5.36;

my @inputs = ( 'Perl Weekly Challenge', 'Long Live Perl', 'AA BB CC D' );

for my $input (@inputs) {
    my $i = first_uniq_char($input);
    say <<END;
        Input: \$s = "$input"
        Output: $i
END
}

sub first_uniq_char( $string ) {
    my @string = split //, $string;
OUTER: for my $i ( 0 .. -1 + scalar @string ) {
        my $c = $string[$i];
        for my $j ( 0 .. -1 + scalar @string ) {
            next if $i == $j;
            my $d = $string[$j];
            next OUTER if $c eq $d;
        }
        return $i;
    }
    return -1;
}
