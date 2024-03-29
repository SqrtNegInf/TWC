#!/usr/bin/env perl
use v5.36;

my @input = @ARGV ? @ARGV:(2, 5, -1, 3);
my $max = 0;
my @ret;

for my $p (0..$#input) {
    for my $s (0..$#input-$p) {
        my $m = eval join "*",@input[$p..$p+$s];
        ($max,@ret) = ($m,@input[$p..$p+$s]) if ($m>$max);
    }
}
say "Max Product: $max";
say "[ ".(join ", ", @ret)." ]";

=begin
perl .\ch-1.pl
Max Product: 10
[ 2, 5 ]

perl .\ch-1.pl 1 2 3 -1 4 5 -1
Max Product: 120
[ 1, 2, 3, -1, 4, 5, -1 ]

perl .\ch-1.pl 1 2 3 -1 0 5 -1
Max Product: 6
[ 1, 2, 3 ]

perl .\ch-1.pl 1 2 3 -1 0 7 -1
Max Product: 7
[ 7 ]
=cut

