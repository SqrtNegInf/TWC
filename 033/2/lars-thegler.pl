#!/usr/bin/env perl

use Modern::Perl;

my $N = 11;

my $table;

for my $n ( 1 .. $N ) {
    for my $m ( $n .. $N ) {
        $table->[$n][$m] = $n * $m;
    }
}

say sprintf "%3s|%s", 'x', join '', map { sprintf "%4d", $_ } 1 .. $N;
say '---|' . '-' x ( $N * 4 );
for my $n ( 1 .. $N ) {
    say sprintf "%3d|%s", $n, join '', map { my $v = $table->[$n][$_]; defined $v ? ( sprintf "%4d", $v ) : ' ' x 4 } 1 .. $N;
}
