#!/usr/bin/env perl
use v5.36;

my $arg = 'Perl {Daily,Weekly,Monthly,Yearly} Challenge';

if ($arg =~ m/\{(.+)\}/) { 
  for my $str  (split(',', $1)) {
      (my $o = $arg ) =~ s/(\{.+\})/$str/;
      say $o;
  }
} 
