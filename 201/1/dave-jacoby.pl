#!/usr/bin/env perl
use v5.36.0;

my @examples = (

    [ 0, 1, 3 ],
    [ 0, 1 ],
    [ 1, 3, 5, 7, 9 ]

);

for my $e (@examples) {
    my $list = join ',', $e->@*;
    my @out  = missing_numbers( $e->@* );
    my $out  = join ',', @out;
    say <<"END";
    Input:  \@array = ($list)
    Output: $out
END
}

sub missing_numbers ( @array ) {
    my $n = scalar @array;
    my %h = map { $_ => 1 } @array;
    my @output;
    for my $v ( 0 .. $n ) {
        push @output, $v unless $h{$v};
    }
    return @output;
}
