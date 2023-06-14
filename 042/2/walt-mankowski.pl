#!/usr/bin/env perl
use v5.36;

srand 1;

my $MAX_LEN = 10;

# return a random string of parens of length $len
sub rand_str($len) {
    return join '', map { rand(2) < 1 ? '(' : ')' } 1..$len;
}

# return true if the parens are balanced, else false
sub balanced($s) {
    my $cnt = 0;
    for my $c (split //, $s) {
        $cnt += $c eq '(' ? 1 : -1;
        return 0 if $cnt < 0; # too many right parens
    }
    return $cnt == 0;
}

for (1..10) {
    my $rs = rand_str(int(rand($MAX_LEN)) + 1);
    say $rs, balanced($rs) ? " - OK" : " - NOT OK";
}
