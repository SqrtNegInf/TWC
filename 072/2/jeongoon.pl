#!/usr/bin/env perl
use v5.36;

my ( $filePath, $from, $to ) = ('input.txt',3,6);
$filePath ||= "<not given>";
$from ||= "<not given>";
$to   ||= "<not given>";

-r $filePath or
  die "Could not find the file: $filePath";

(scalar  map { /^\d+$/ ? () : 0 } $from, $to) and
  die "Wrong number: from: $from, to: $to";

$from < 0 and warn "line starts from no. 1 not: $from\n".
  "-> start from ".($from = 1);

$to < $from and warn( "end line is below than begin line: Quit." ), exit 0;

open( my $fh, '<', $filePath ) or die "Unexpected Error: $@\n: Quit.";

#warn "Showing File: $filePath from : $from to: $to";

my $lnum     = 1;
my $printing = 0;

while ( defined (my $line = <$fh>) ) {
    if  ( $lnum == $from ) { $printing ^= 1    }
    elsif ( $lnum == $to ) { print $line; last }
    print $line if $printing;
    ++$lnum;
}

close $fh;
