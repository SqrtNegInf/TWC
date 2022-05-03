#!/usr/bin/env raku

sub MAIN ( UInt() $n = 19) {
    my @M; 
    my @F = lazy gather {
        my $n = 0;
        take 1;
        loop {
            $n++;
            take $n - @M[@F[$n-1]];
        }
    }

    @M = lazy gather {
        my $n = 0;
        take 0;
        loop {
            $n++;
            take $n - @F[@M[$n-1]];
        }
    };

    say "F : {@F[0..$n].join(", ")}";
    say "M : {@M[0..$n].join(", ")}";
}
