#!/usr/bin/env perl

my ($file, $A, $B) = ('input.txt',3,6);

die "Cannot read from '$file' ($!)"
  unless (-r $file);

die "A must be positve number"
  unless (defined $A and $A =~ m#^[1-9][0-9]*$#);

die "B must be positve number and bigger than A"
  unless (defined $A and $A =~ m#^[1-9][0-9]*$# and $A <= $B);

if (!open(F, "<$file")) {
  die "Weird... I thought we could read from '$file'...";
} else {
  while (<F>) {
     print if ($. >= $A and $. <= $B);
  }
  close(F);
}
