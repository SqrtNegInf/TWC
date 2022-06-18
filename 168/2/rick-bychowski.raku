#!/usr/bin/env raku

sub MAIN(Int $n where $n > 1 = 10) {
    say factor($n);
}

sub factor(Int $n, $hpn = '') {
    my Int $f1;
    my Int $f2;
    my $hp = $hpn;
    for 2 ..^ $n -> $i {
        if $n %% $i {
            $f1 = $i;
            $f2 = Int($n/$i);
            last;
        }
    }
    if $f1.defined {
        $hp ~= $f1;
        if $f2.is-prime {
            $hp ~= $f2;
            factor(Int($hp));
        } else {
            factor($f2, $hp);
        }
    } else {
        return $n;
    }
}
