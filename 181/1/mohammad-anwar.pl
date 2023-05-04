#!/usr/bin/env perl
use v5.36;

$_ = <<~ 'PARAGRAPH';
    All he could think about was how it would all end. There was still a bit of uncertainty in the equation, but the basics were there for anyone to see. No matter how much he tried to see the positive, it wasn't anywhere to be seen. The end was coming and it wasn't going to be pretty.
    PARAGRAPH

chomp;
my @lines  = split /\.\s/;
my @sorted = ();
foreach (@lines) {
   my @words = split /\s+/;
   push @sorted, (join  " ",
                  sort  { uc($a) cmp uc($b) }
                  split /\s+/
                 ) . '.';
}

say join " ", @sorted;
