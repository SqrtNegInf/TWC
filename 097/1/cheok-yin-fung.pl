#!/usr/bin/env perl
use v5.36;

sub cipher {
    my $leftshift = 13;
    my $c = $_[0];
    if ($c =~ /^[A-Z]$/) {
      my $encrypted = chr( ( ord($c)  - ord('A') - $leftshift) % 26 + ord('A') );
      return $encrypted;
    } else {
        return $c;
    }
}

my @a = split //, 'PERL ROCKS';
my @e = map { cipher($_) } @a;

print join '', @e;

print "\n";
