#!/usr/bin/env perl
use v5.36;

my $s;
while ($s = <DATA>) {
    chomp($s);
    if ( length $s == 15 &&
        substr($s, 4, 1) eq " " && 
        substr($s, -11) =~ / \d{10}/ &&
        (substr($s,0,4) =~ /\d{4}/ ||
         substr($s,0,4) =~ /\+\d{2}/ ||
         substr($s,0,4) =~ /\(\d{2}\)/)
    ) {
        print $s, "\n";
    }
}

__END__
0044 1148820341
 +44 1148820341
  44-11-4882-0341
(44) 1148820341
  00 1148820341
