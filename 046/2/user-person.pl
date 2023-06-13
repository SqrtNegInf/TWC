#!/usr/bin/env perl
use v5.36;

my @doors = ();
my $MAX = 500;

sub change {
    return $_[0] eq "OPENED" ? "CLOSED" : "OPENED";
}

push @doors, "CLOSED" foreach (0..$MAX);

ROOM:
for ( my $i = 1; $i <= $MAX; ++$i ) {

    if ($i > $MAX / 2 ) { 
       $doors[$i] =  change $doors[$i];
       next ROOM;
   }

   for ( my $j = 1; $j <= $MAX; ++$j ) {
       if ($j % $i == 0) {
           $doors[$j] =  change $doors[$j];
       }
   }
}

for ( my $k = 1; $k <= $MAX; ++$k ) { 
    print "$k " if $doors[$k] eq "OPENED";
}
print "\n";
