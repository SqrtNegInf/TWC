#!/usr/bin/env perl
use v5.36;

use Test::More;
use Algorithm::Combinatorics qw/permutations/;

my $cases = [
    'IDID',
    'III',
    'DDI',
];

sub di_string_match
{
    my $str = shift;

    my @str = split('', $str);

    my @res;
    my $iter = permutations([0..length($str)]);
    PERMUTATION: while (my $p = $iter->next) {
        for my $i (0..$#str) {
            next PERMUTATION unless $str[$i] eq 'I' and $p->[$i] < $p->[$i+1] or
                                    $str[$i] eq 'D' and $p->[$i] > $p->[$i+1];
        }
        push @res, $p;
    }
    @res = sort {join('-', @$a) cmp join('-', @$b)} @res;

    return \@res;
}

is_deeply(di_string_match($cases->[0]), [[ 0, 2, 1, 4, 3 ],
                                         [ 0, 3, 1, 4, 2 ],
                                         [ 0, 3, 2, 4, 1 ],
                                         [ 0, 4, 1, 3, 2 ],
                                         [ 0, 4, 2, 3, 1 ],
                                         [ 1, 2, 0, 4, 3 ],
                                         [ 1, 3, 0, 4, 2 ],
                                         [ 1, 3, 2, 4, 0 ],
                                         [ 1, 4, 0, 3, 2 ],
                                         [ 1, 4, 2, 3, 0 ],
                                         [ 2, 3, 0, 4, 1 ],
                                         [ 2, 3, 1, 4, 0 ],
                                         [ 2, 4, 0, 3, 1 ],
                                         [ 2, 4, 1, 3, 0 ],
                                         [ 3, 4, 0, 2, 1 ],
                                         [ 3, 4, 1, 2, 0 ],
                                        ], 'IDID');
is_deeply(di_string_match($cases->[1]), [[ 0, 1, 2, 3 ],
                                        ], 'III');
is_deeply(di_string_match($cases->[2]), [[ 2, 1, 0, 3 ],
                                         [ 3, 1, 0, 2 ],
                                         [ 3, 2, 0, 1 ],
                                        ], 'DDI');
done_testing();

exit 0;

         
