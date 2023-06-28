#!/usr/bin/env perl
use v5.36;

my $S = $ARGV[0] || 'PERL ROCKS';
my $N = $ARGV[1] || 13;

$N = $N%26;

my @chars = split //, $S;

foreach(@chars) {

    my $original_ascii = ord($_);
    my $shifted_ascii = $original_ascii-$N;

    if(($original_ascii < 91 && $shifted_ascii < 65) or ($original_ascii >= 97 && $shifted_ascii < 97)) {
      $shifted_ascii += 26;
    }

    print chr($shifted_ascii);
}

print "\n";
