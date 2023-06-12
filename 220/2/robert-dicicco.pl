#!/usr/bin/env perl
use v5.36;

use Algorithm::Permute qw/permute/;

my @ints = (1,8,17);
my $flag = 0;
my $elems = $#ints;

sub IsPerfectSquare {
    my $number_to_test = shift;
    my $root = int(sqrt($number_to_test));
    if (($root ** 2 ) == $number_to_test) {
        return 1;
    }
    return undef;
}

say "Input: \@ints = @ints";

# print all permutations of @ints
print("Output: ");
my $p = Algorithm::Permute->new(\@ints);
while ( my @perm = $p->next ) {
    for (my $tv = 0; $tv < $#perm; $tv++) {
        if (IsPerfectSquare($perm[$tv] + $perm[$tv+1])) {
            $flag += 1;
        } else {
            $flag = 0;
        }
    }

    if ($flag == $elems) {
        print("(@perm) ");
    }
    $flag = 0;
}

print("\n");
