#!/usr/bin/env perl
use v5.36;

use JSON;
my $json = JSON->new->pretty->canonical;

use List::Util qw{  sum0 };
for my $s ( 1 .. 4 ) {
    my @x = bball($s);
    say qq{INPUT:\t\$s = $s};
    say join "\t", "OUTPUT:", map { qq{$_\n}} @x;
}

sub bball ( $n = 5, $s = [] ) {
    my $sum = sum0 $s->@*;
    return undef if $sum > $n;
    return join ' ', $s->@* if $sum == $n;
    my @output;
    for my $i ( 1 .. 3 ) {
        my $x->@* = $s->@*;
        push $x->@*, $i;
        my @local = bball( $n, $x );
        for my $l (@local) {
            next unless defined $l;
            next if ref $l eq 'ARRAY';
            push @output, $l;
        }
    }
    return @output;
}
