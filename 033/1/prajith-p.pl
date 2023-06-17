#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

my %c = ();

sub C {
    my $file = shift;
    open(my $fh, '<', $file) or warn $!;
    while (my $line = <$fh>) {
        my @words = map { $c{lc($_)} += 1 } grep { m/[a-zA-Z]/ } split(//, $line);
    }
    close($fh);
}

C($_) for ('../00-blogs');

say $_ . ':' . $c{$_} for 'a'..'z';
