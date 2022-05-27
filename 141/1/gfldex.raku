#! /usr/bin/env raku
# from https://gfldex.wordpress.com/2021/11/30/monkey-see-no-crossproduct/

# Build an infinite list of integers that have 8 divisors and then shows
# the first 10 of those. This is done by iterating to infinity and bailing as
# early as possible, if the condition of having 8 divisors is net or we get
# beyond the to be checked value. 

# Since grep wants arity of 1, we use # .assuming to please it.

sub has-m-divisors($m, $n) {
    (1..∞).grep({ last if $_ > $n; $n %% $_ ?? (last if $++ ≥ $m; True) !! False })[^∞].elems == $m;
}

my $divisors = 8;
put (1..∞).grep(&has-m-divisors.assuming($divisors))[^10];

