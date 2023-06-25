#!/usr/bin/env perl
use v5.36.0;

my @examples = (

    [ 1, 2, 2, 3 ],
    [ 1, 3, 2 ],
    [ 6, 5, 5, 4 ],
    [ map { 7 } 1 .. 6 ],
);

for my $e (@examples) {
    my $list = join ',', $e->@*;
    my $out  = monotonic( $e->@* );
    say <<"END";
    Input:  \@array = ($list)
    Output: $out
END
}

sub monotonic (@array) {
    my $increasing = 0;
    my $decreasing = 0;
    for my $i ( 1 .. -1 + scalar @array ) {
        for my $j ( 0 .. -1 + $i ) {
            my $k = $array[$j] <=> $array[$i];
            $decreasing++ if $k == -1;
            $increasing++ if $k == 1;
            return 0      if $decreasing && $increasing;
        }
    }
    return 1;
}
