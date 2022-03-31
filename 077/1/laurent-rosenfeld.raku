#!/usr/bin/env raku

# (Modified task)
my $n = @*ARGS[0]:exists ?? @*ARGS[0] !! 377;
my @fib = 1, 2, * + *  ... ^ * >= $n;
for @fib.combinations -> $s {
    say $s if $n == [+] $s;
}
