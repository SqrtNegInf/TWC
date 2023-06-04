#!/usr/bin/env perl
use v5.36;

use lib ".";
use FibSum qw(_fib);

# The biggest Fibonacci number that fits in an integer is f(93).
# That's way overkill -- only N up to about 3 digits is reasonable.
my $N_MAX = _fib(93);

sub Usage { "Usage: $0 N\n\t0 < N < 10000" };

my $N = 377;

die Usage() unless $N;
die Usage() unless 0 < $N && $N <= $N_MAX;

my $task = FibSum->new($N);
my $result = $task->run();

# Result is an array of arrays.
for my $answer ( @$result )
{
    say join(' + ', sort { $a <=> $b } @$answer), " = $N";
}
