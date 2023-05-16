#!/usr/bin/env perl
use v5.36;

my $N = shift // 20;  #1081;
my $candidate;
my @out = (0);
while ( ++$candidate ) {
    push @out, $candidate if is_fib( digisum($candidate) );
    last if @out == $N;
}
local $" = ', ';
say "@out";
sub digisum ( $num ) {
    my $sum;
    $sum += substr $num, $_-1, 1 for (1..length $num);
    return $sum;   
}
sub is_fib ( $num ) {
    state @fibs = ( 0, 1 );
    state %fhash = map { $_ => undef } @fibs;
    while ( $fibs[-1]+$fibs[-2] <= $num ) {
        my $next = $fibs[-1]+$fibs[-2];
        push @fibs, $next;
        $fhash{$next} = undef;
    }
    return 1 if exists $fhash{$num};
    return 0;
}
