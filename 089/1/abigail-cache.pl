#!/usr/bin/env perl
use v5.36;

#sub stein;
sub stein ($u, $v) {
    state $cache;
    $$cache {$u . $v} //= sub ($u, $v) {
        return $u if $u == $v || !$v;
        return $v if             !$u;
        my $u_odd = $u % 2;
        my $v_odd = $v % 2;
        return stein ($u >> 1, $v >> 1) << 1 if !$u_odd && !$v_odd;
        return stein ($u >> 1, $v)           if !$u_odd &&  $v_odd;
        return stein ($u,      $v >> 1)      if  $u_odd && !$v_odd;
        return stein ($u - $v, $v)           if  $u     >   $v;
        return stein ($v - $u, $u);
    } -> ($u, $v);
}

#
# Iterate over all pairs, sum the gcd.
#
while (my $N = <DATA>) {
    chomp $N;
    my $sum = 0;
    foreach my $i (1 .. $N) {
        foreach my $j ($i + 1 .. $N) {
            $sum += stein $i, $j;
        }
    }
    say $sum;
}

__END__
3
4
100
1000
365
512
