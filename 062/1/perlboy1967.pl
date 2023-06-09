#!/usr/bin/env perl
use v5.36;
no warnings;

my @emailInput;
my @emailOutput;

my $uniq = 0;
#shift(@ARGV) if $uniq;
push @ARGV, 'input-list.txt';

foreach (@ARGV) {
  my $fh;

  if ($_ eq '-') {
    open($fh, '<&STDIN');
  } else {
    open($fh, $_);
  }

  while (<$fh>) {
    push (@emailInput, $1) if (m#^\s*(.*?)\s*$#);
  }
}

@emailOutput = sort sortEmail @emailInput;
#@emailOutput = keys { map { lc($_) => 1 } @emailOutput}
#  if ($uniq);

print join("\n", @emailOutput, '');

sub sortEmail {
  my ($r1, $d1) = $_[0] =~ m#^([^@]+)@(.*)#;
  my ($r2, $d2) = $_[1] =~ m#^([^@]+)@(.*)#;

  return (lc($d1) cmp lc($d2) || $r1 cmp $r2);
}

