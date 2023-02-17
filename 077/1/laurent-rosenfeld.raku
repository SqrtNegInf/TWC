#!/usr/bin/env raku

# 2023-02-16 as per comment in GH5209:
#     $s is an itemized scalar, so it doesn't iterate, so it takes the number of elements in $s. You should use a @s

my $n = @*ARGS[0]:exists ?? @*ARGS[0] !! 377;
my @fib = 1, 2, * + *  ... ^ * >= $n;
for @fib.combinations -> @s {
    say @s if $n == [+] @s;
}

=finish

Prior version:
for @fib.combinations -> $s {
    say $s if $n == [+] $s;
}
