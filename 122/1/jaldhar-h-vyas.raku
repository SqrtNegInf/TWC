#!/usr/bin/env raku

my @N = <10 20 30 40 50 60 70 80 90 100>;
    my $total = 0;
    my $count = 1;
    my @averages;

    for  @N -> $arg {
        $total += $arg;
        @averages.push($total / $count++);
    }

    @averages.join(q{ }).say;
