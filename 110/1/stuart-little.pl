#!/usr/bin/env perl
use v5.36;

sub getNrs($data) {
    my @nrs = $data =~ m/((?:\+\d{2}|\(\d{2}\)|\d{4})\s+\d{10})/gsm;
    return \@nrs;
}

my $fh;
(scalar @ARGV) ? (open($fh, '<', $ARGV[0])) : ($fh = *DATA);

my $data;
{
    local $/ = undef;
    $data = <$fh>;
}

for (@{getNrs($data)}) {say};

__DATA__
0044 1148820341
 +44 1148820341
  44-11-4882-0341
(44) 1148820341
  00 1148820341
