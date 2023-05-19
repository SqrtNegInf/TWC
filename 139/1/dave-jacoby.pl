#!/usr/bin/env perl
use v5.36;

my @examples;
push @examples, [ 1 .. 5 ];
push @examples, [ 1, 3, 2, 4, 5 ];
push @examples, [ 1 .. 20 ];
#push @examples, [ sort { rand 1 <=> rand 1 } 1 .. 20 ];

for my $input (@examples) {
    my $o = jortsort( $input->@* );
    my $i = join ',',$input->@*;
    say <<"END";
    Input: \@n = ($i)
    Output: $o
END
}

# basically? It's sorted already, or go back and try again.
sub jortsort (@array ) {
    my @copy = sort { $a <=> $b } @array;
    for my $i ( 0 .. -1 + scalar @array ) {
        return 0 if $copy[$i] ne $array[$i];
    }
    return 1;
}
