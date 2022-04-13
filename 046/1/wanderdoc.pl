#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);


my $message = <<'EOF';
P + 2 l ! a t o
1 e 8 0 R $ 4 u
5 - r ] + a > /
P x w l b 3 k \
2 e 3 5 R 8 y u
< ! r ^ ( ) k 0
EOF

sub arrays
{
     my @strings =  map [split(/\s/, $_)], split(/\n/, $message);

     my $max_idx = $#{$strings[0]};
     my @cols = map { my $idx = $_; 
          my @slice = map $_->[$idx] // '', @strings; [@slice];
          } 0 .. $max_idx;

     my @doubles = map { my %seen; grep $seen{$_}++ > 0, @$_;} @cols;

     print join('',@doubles), $/; # PerlRaku
}


sub strings
{
     my @strings =  map {tr/ //ds; $_;} split(/\n/, $message);
     my $len = length($strings[0]);


     # BrowserUK: http://www.perlmonks.org/?node_id=1202721:
     my $buf = chr(0)  x $len;
     my @cRefs = map \substr( $buf, $_, 1 ), 0 .. $len - 1;

     my $txt;

     for my $idx ( 0 .. $len - 1 )
     {
          my ($letter) = do 
          { 
               my %seen; 
               grep $seen{$_}++ > 0, 
               map { substr( $buf, 0 )  = $_; ${ $cRefs[ $idx ] }; } @strings; 
          };
     $txt .= $letter;
     }

     print $txt, $/; # PerlRaku
}

strings();
arrays();
