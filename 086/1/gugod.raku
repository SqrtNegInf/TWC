#!/usr/bin/env raku

sub v1-exists-diff-by (Num $A, @N) {
    @N.combinations(2).first(-> @combo { $A == abs([-] @combo) });
}

sub v2-exists-diff-by (Num $A, @N) {
    my %pos;
    @N.kv.map(-> $k, $v { %pos{$v}.push($k) });
    @N.first(
        -> $n {
            %pos{$n + $A}:exists or %pos{$n - $A}:exists
        });
}

my $A = 7.Num;
my @N = (10, 8, 12, 15, 5);

say v1-exists-diff-by($A, @N) ?? 1 !! 0;
say v2-exists-diff-by($A, @N) ?? 1 !! 0;
