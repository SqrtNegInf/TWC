#!/usr/bin/env perl
use v5.36;

for my $i (1..20) {
    say "L($i) = " . leonardo($i);
}

# Leonardo
sub leonardo {
    my $n = shift;
    return 1 if ($n == 0 or $n == 1);

    # Recursive
    return (
        leonardo($n-1) +  # l(n-1)
        leonardo($n-2) +  # l(n-2)
        1                 # 1
    );
}
