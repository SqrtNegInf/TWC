#!/usr/bin/env raku

my @input_n = (10,1,20);

for (@input_n) -> $n {
     say "Input: \$n = $n";
    my $num = 0;
    my $cnt = 0;
    while $num < $n {
        $cnt++ if $num.is-prime;
        $num++;
    }
    say "$cnt\n";
}
