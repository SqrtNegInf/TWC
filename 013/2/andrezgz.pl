#!/usr/bin/env perl
use v5.36;

my $last_term = $ARGV[0] ? $ARGV[0]-1 : 20;

print 'F: '.join(',', map { F($_) } (0 .. $last_term) ).$/;
print 'M: '.join(',', map { M($_) } (0 .. $last_term) ).$/;


sub F {
    my ($n) = @_;
    return 1 unless $n;
    return $n - M(F($n-1));
}

sub M {
    my ($n) = @_;
    return 0 unless $n;
    return $n - F(M($n-1));
}
