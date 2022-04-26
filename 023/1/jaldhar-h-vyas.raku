#!/usr/bin/env raku

#multi sub MAIN()  {

    my $n = 1;
    my @series=(5, 9, 2, 8, 1, 6);
    for 0 ..^ $n {
        @series = (1 ..^ @series.elems).map({ @series[$_] - @series[$_ - 1] });
    }

    @series.join(q{, }).say;
#}
