#!/usr/bin/env perl
use v5.36;
sub is_perfect_square ( $n ) {
    return $n == ( int(sqrt $n) ** 2 );
}

sub task2 ( @ns ) {

    my %square_pairs;
    for     my $x (@ns) {
        for my $y (@ns) {
            if ( is_perfect_square( $x + $y ) ) {
                $square_pairs{$x}{$y} = $y;
                $square_pairs{$y}{$x} = $x;
            }
        }
    }

    my ( $bag_add, $bag_del, $bag_keys, $bag_empty );
    {
        my %n_count;
        $bag_add   = sub ( $n ) { $n_count{$n}++; };
        $bag_del   = sub ( $n ) { $n_count{$n}--;  delete $n_count{$n} if not $n_count{$n}; };
        $bag_keys  = sub ()     { sort { $a <=> $b } keys %n_count };
        $bag_empty = sub ()     {                     not %n_count };
    }

    $bag_add->($_) for @ns;

    my $recursing = sub ( $head ) {
        return [$head] if $bag_empty->();

        my @ret;
        for my $c ( grep {defined} @{$square_pairs{$head}}{ $bag_keys->() } ) {
            $bag_del->($c);
            push @ret, map { [$head, @{$_} ] } __SUB__->( $c );
            $bag_add->($c);
        }
        return @ret;
    };

    my @ret;
    for my $head ( $bag_keys->() ) {
        $bag_del->($head);
        push @ret, $recursing->( $head );
        $bag_add->($head);
    }

    return \@ret;
}


my @tests = (
    [ [1, 17, 8] , [ [1, 8, 17], [17, 8, 1] ] ],
    [ [2,  2, 2] , [ [2, 2,  2],            ] ],

    [ [ 1..14 ] , [  ] ],
    [ [ 1..15 ] , [ [8, 1, 15, 10, 6, 3, 13, 12, 4, 5, 11, 14, 2, 7, 9],
                        [9, 7, 2, 14, 11, 5, 4, 12, 13, 3, 6, 10, 15, 1, 8] ] ],
    [ [ 1..16 ] , [ [8, 1, 15, 10, 6, 3, 13, 12, 4, 5, 11, 14, 2, 7, 9, 16],
                        [16, 9, 7, 2, 14, 11, 5, 4, 12, 13, 3, 6, 10, 15, 1, 8] ] ],
    [ [ 1..17 ] , [ [16, 9, 7, 2, 14, 11, 5, 4, 12, 13, 3, 6, 10, 15, 1, 8, 17],
                        [17, 8, 1, 15, 10, 6, 3, 13, 12, 4, 5, 11, 14, 2, 7, 9, 16] ] ],
    [ [ 1..18 ] , [  ] ],
    [ [ 1..19 ] , [  ] ],
    [ [ 1..20 ] , [  ] ],
    [ [ 1..21 ] , [  ] ],
    [ [ 1..22 ] , [  ] ],
    [ [ 1..23 ] , [
        [2, 23, 13, 12, 4, 21, 15, 10, 6, 19, 17, 8, 1, 3, 22, 14, 11, 5, 20, 16, 9, 7, 18],
        [9, 16, 20, 5, 11, 14, 22, 3, 1, 8, 17, 19, 6, 10, 15, 21, 4, 12, 13, 23, 2, 7, 18],
        [18, 7, 2, 23, 13, 12, 4, 21, 15, 10, 6, 19, 17, 8, 1, 3, 22, 14, 11, 5, 20, 16, 9],
        [18, 7, 9, 16, 20, 5, 11, 14, 2, 23, 13, 12, 4, 21, 15, 10, 6, 19, 17, 8, 1, 3, 22],
        [18, 7, 9, 16, 20, 5, 11, 14, 22, 3, 1, 8, 17, 19, 6, 10, 15, 21, 4, 12, 13, 23, 2],
        [22, 3, 1, 8, 17, 19, 6, 10, 15, 21, 4, 12, 13, 23, 2, 14, 11, 5, 20, 16, 9, 7, 18], ] ],
    [ [ 1..24 ] , [  ] ],
    [ [ 1..25 ] , [
        [2, 23, 13, 12, 24, 25, 11, 14, 22, 3, 1, 8, 17, 19, 6, 10, 15, 21, 4, 5, 20, 16, 9, 7, 18],
        [3, 22, 14, 2, 23, 13, 12, 4, 21, 15, 10, 6, 19, 17, 8, 1, 24, 25, 11, 5, 20, 16, 9, 7, 18],
        [4, 21, 15, 10, 6, 19, 17, 8, 1, 3, 22, 14, 2, 23, 13, 12, 24, 25, 11, 5, 20, 16, 9, 7, 18],
        [8, 17, 19, 6, 10, 15, 21, 4, 12, 13, 23, 2, 14, 22, 3, 1, 24, 25, 11, 5, 20, 16, 9, 7, 18],
        [9, 16, 20, 5, 4, 21, 15, 10, 6, 19, 17, 8, 1, 3, 22, 14, 11, 25, 24, 12, 13, 23, 2, 7, 18],
        [10, 15, 21, 4, 12, 13, 23, 2, 14, 22, 3, 6, 19, 17, 8, 1, 24, 25, 11, 5, 20, 16, 9, 7, 18],
        [11, 25, 24, 12, 13, 23, 2, 14, 22, 3, 1, 8, 17, 19, 6, 10, 15, 21, 4, 5, 20, 16, 9, 7, 18],
        [13, 23, 2, 14, 22, 3, 1, 8, 17, 19, 6, 10, 15, 21, 4, 12, 24, 25, 11, 5, 20, 16, 9, 7, 18],
        [18, 7, 2, 23, 13, 12, 24, 25, 11, 14, 22, 3, 1, 8, 17, 19, 6, 10, 15, 21, 4, 5, 20, 16, 9],
        [18, 7, 9, 16, 20, 5, 4, 21, 15, 10, 6, 19, 17, 8, 1, 3, 22, 14, 2, 23, 13, 12, 24, 25, 11],
        [18, 7, 9, 16, 20, 5, 4, 21, 15, 10, 6, 19, 17, 8, 1, 3, 22, 14, 11, 25, 24, 12, 13, 23, 2],
        [18, 7, 9, 16, 20, 5, 11, 25, 24, 1, 3, 22, 14, 2, 23, 13, 12, 4, 21, 15, 10, 6, 19, 17, 8],
        [18, 7, 9, 16, 20, 5, 11, 25, 24, 1, 8, 17, 19, 6, 3, 22, 14, 2, 23, 13, 12, 4, 21, 15, 10],
        [18, 7, 9, 16, 20, 5, 11, 25, 24, 1, 8, 17, 19, 6, 10, 15, 21, 4, 12, 13, 3, 22, 14, 2, 23],
        [18, 7, 9, 16, 20, 5, 11, 25, 24, 1, 8, 17, 19, 6, 10, 15, 21, 4, 12, 13, 23, 2, 14, 22, 3],
        [18, 7, 9, 16, 20, 5, 11, 25, 24, 12, 4, 21, 15, 10, 6, 19, 17, 8, 1, 3, 13, 23, 2, 14, 22],
        [18, 7, 9, 16, 20, 5, 11, 25, 24, 12, 4, 21, 15, 10, 6, 19, 17, 8, 1, 3, 22, 14, 2, 23, 13],
        [18, 7, 9, 16, 20, 5, 11, 25, 24, 12, 13, 23, 2, 14, 22, 3, 1, 8, 17, 19, 6, 10, 15, 21, 4],
        [22, 14, 2, 23, 13, 3, 1, 8, 17, 19, 6, 10, 15, 21, 4, 12, 24, 25, 11, 5, 20, 16, 9, 7, 18],
        [23, 2, 14, 22, 3, 13, 12, 4, 21, 15, 10, 6, 19, 17, 8, 1, 24, 25, 11, 5, 20, 16, 9, 7, 18], ] ],
);
use Test::More;
plan tests => 0+@tests;
for (@tests) {
    my ( $in_aref, $expected_aref ) = @{$_};
    is_deeply task2(@{$in_aref}), $expected_aref;
}
