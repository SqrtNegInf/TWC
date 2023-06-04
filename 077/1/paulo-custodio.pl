#!/usr/bin/env perl
use v5.36;

use Math::Combinatorics;

my($N) = 377;

# compute list of Fibonacci numbers up to input
my @fib = (0, 1);
compute_fib($N);

# terms for addition are the Fibonacci numbers except the first two terms (0,1)
my @terms = @fib[2 .. $#fib];

my @out;
for my $k (1 .. scalar(@terms)) {
    my $combinat = Math::Combinatorics->new(count => $k, data => \@terms);
    while(my @set = $combinat->next_combination) {
        if (sum(@set) == $N) {
            @set = sort {$a<=>$b} @set;
            push @out, join(" + ", @set)." = $N\n";
        }
    }
}

# sort result so that it is deterministic
print sort(@out);


sub compute_fib {
    my($target) = @_;
    while ($fib[-1] < $target) {
        push @fib, $fib[-1]+$fib[-2];
    }
}

sub sum {
    my($sum, @a) = @_;
    $sum += $_ for @a;
    return $sum;
}
