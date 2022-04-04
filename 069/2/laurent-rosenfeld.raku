#!/usr/bin/env raku

sub switch (Str $num) {
    [~] $num.comb.map({$_ eq "0" ?? 1 !! 0});
}

my $prev = '001';
for 3..7 -> $i {
    $prev = $prev ~ "0" ~ switch $prev.flip;
    say "$i $prev";
}
