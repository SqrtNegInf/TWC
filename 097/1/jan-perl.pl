#!/usr/bin/env perl
use v5.36;

sub inittrs {
  my ($shift) = @_;
  my $p1=" ";
  my $p2=" ";
  for my $t (0..25) {
     $p1 .= chr(ord('A')+$t);  
     $p2 .= chr(ord('A')+($t-$shift)%26);
  }
  return ($p1,$p2);
}

my $S = "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG";
my $N = 3;

my ($plain,$cipher)= inittrs($N);
print "Plain:    $plain\n";
print "Cipher:   $cipher\n";

eval ("\$S=~ tr/$plain/$cipher/");
print "$S\n";
