#!/usr/bin/env perl
use v5.36;

srand 1;

my $s='';
foreach (-1..2*(int(rand()*4))) {
  $s .= (rand()<0.5)?'(':')';
}

print "$s\n";

while ($s =~ s/\(\)//g) {
}

if ($s) {
  print "Invalid: $s\n";
} else {
  print "Valid.\n";
}
