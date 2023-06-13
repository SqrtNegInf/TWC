#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

GetOptions(\my %option, 'verbose|v') or die "Bad options\n";

# -v or --verbose for detailed output.

my @circle = ( 1 .. 50 );

for (my $i = 1; scalar @circle > 1 ; ++$i) {

    print "i: $i\n" if $option{verbose};
    
    my $victim = splice(@circle, $i, 1);
    
    if ($option{verbose}) {
        
        print $circle[$i-1] . " killed " . $victim . "\n";
        print "@circle\n\n";

    }

    # When the end of the array is reached,
    # roll back the index to go back around the circle for another iteration.
    # In odd cases the next victim will be 0. In even cases it will be 1.
    # These have to be adjusted due to the for loop's incrementing: -1 for odd, 0 for even.
    
    if ( $#circle - $i == 0) {

        $i = -1;

    } elsif ( $#circle - $i == -1) {

        $i = 0;

    }
}

print "@circle survives\n";

