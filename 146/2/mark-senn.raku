#!/usr/bin/env raku

my $member = '3/5'; #$*IN.get;

# Split into numerator and denominator.
my ($n, $d) = $member.split('/');

say "Input: \$member = '$n/$d'";

for ('Output: parent =', ' and grandparent =') -> $label {
    given ($n <=>  $d) {
        when -1  { $d = $d - $n;            } # n < d
        when 0   { say "no parent"; exit 1; } # n = d
        when 1   { $n = $n - $d;            } # n > d
    }
    print "$label $n/$d";
}

say '';
