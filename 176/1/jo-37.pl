#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;
use Math::Prime::Util qw(fromdigits todigits todigitstring);
use List::Util qw(all);
use Algorithm::Combinatorics qw(variations);
use Coro::Generator;

our ($examples, $verbose, $base) = (1,1);

$base ||= 10;

run_tests() if $examples;	# does not return

die <<EOS unless @ARGV == 1;
usage: $0 [-examples] [-verbose] [-base=B] [N]

-examples
    run the examples from the challenge
 
-verbose
    print the found number along with its multiples in the given base

-base=B
    use base B

N
    print first N "permuted multiples numbers" in base B
    
EOS


### Input and Output

main: {
    my $permult = gen_perm_mult($base);
    for my $n (map $permult->(), 1 .. shift) {
        last unless $n;
        if ($verbose) {
            # Number and its multiples in given base.
            say join ', ', map todigitstring($n * $_, $base), 1 .. 6;
        } else {
            # Decimal number only.
            say $n;
        }
    }
}


### Implementation

# Additional assumptions:
# - If the multiples shall consist of a permutation of the original
#   number's digits, these digits need to be distinct.  Otherwise the
#   concept of a permutation would not make sense.
# - A leading zero is not permitted.
# Furthermore, there is no need to restrict the task to base 10 or to
# find only the minimum number.
#
# All results for bases 8, 10, 12 and 13 can be found. There are no
# results for other bases below 13.  While base 12 can be handled in
# about 12 min here, base 13 takes about 5 h.
#
# There is an interesting results in base 8: 1234567
#
# For bases up to 12, the leading digit must always be 1.  See below for
# different results in bases 17, 19 and 24.

# Build a generator for "permuted multiples" in the given base.
sub gen_perm_mult ($base) {
    my $done;
    generator {
        # Do not allow the generator to start over.
        yield(undef), return if $done++;
        # The minimum length of such a number cannot be less than six as
        # the number itself and its multiples all have different leading
        # digits if they are of the same length.  The maximum length is
        # the base because all digits shall be distinct.  The
        # $len variable is off by one here as we treat the leading digit
        # separately.
        for my $len (5 .. $base - 1) {
            # There shall be no leading zero and the sixfold of it needs
            # to be below the base.
            for my $ld (1 .. int(($base - 1) / 6)) {
                # Create a hash with all possible digits as keys.
                (\my %digits)->@{0 .. $base - 1} = ();
                # Remove the leading digit.
                delete $digits{$ld};
                # Loop over all variations (a.k.a. k-permutations of n)
                # of digits (except the leading digit) in the given base
                # and in the current length as candidate numbers.
                my $v_it = variations([sort {$a <=> $b} keys %digits], $len);
                while (my $v = $v_it->next()) {
                    # Prepend the leading digit.
                    my @p = ($ld, @$v);
                    # Get the candidate number from the digits in the
                    # given base.
                    my $n = fromdigits \@p, $base;
                    # Check if the digits of all requested multiples of
                    # the candidate number form a permutation of the
                    # candidate number's digits.
                    yield $n
                        if all {isperm(\@p, [todigits $n * $_, $base])} 2..6;
                }
            }
        }
    }
}

# Check if the array @$q is a permutation of @$p.  This is the case if
# all elements of @$p occur in @$q and both arrays have the same length.
sub isperm ($p, $q) {
    return unless @$p == @$q;
    # Create a hash %q having keys from @$q and values 1.
    (\my %q)->@{@$q} = (1) x @$q;
    # Check if all elements of @$p occur in %q.
    @$p == grep $_, @q{@$p};
}


### Examples and tests

sub run_tests {
    is gen_perm_mult(10)->(), 142857, 'task 1';

    done_testing;
    exit;
}
