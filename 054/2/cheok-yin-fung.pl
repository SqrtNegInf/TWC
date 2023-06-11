#!/usr/bin/env perl
use v5.36;

my $MAX_U = 333334;  
# Laurent's codes and explanations on blog teach me that
# this cutting value should be fine-tuned rather 
# than making it as large as the systems allow.
# (my 40-hrs attempt use $MAX_U = 2^27; in addition, 
# those codes did not follow "YAGNI" rule - ambitious but "unoptimized",
# hence my laptop suffered for 40 hrs)

my $TARGET_BEGIN = 1;
my $TARGET_END = 10000;  


#space allocation
my @seqlength; 
my %SeqlengthLargeInt = (1=>1);

$seqlength[1] = 1;

foreach (1..27) {
    $seqlength[2**$_] = 1+$_; 
    $SeqlengthLargeInt{2**$_} = 1+$_;
}


sub traceSmallint {
    my @route = reverse @_;

    my $h = shift @route;
    my $ref;
    foreach $ref (@route) {
        $seqlength[$ref] = 1 + $seqlength[$h];
        $h = $ref;
    }
    $SeqlengthLargeInt{$route[0]} = $seqlength[$route[0]];
}



   ###########################

    my $mazed = 23;
    print $mazed, " ";
    while ($mazed != 1) {
            if ($mazed % 2 == 1) {
                $mazed = $mazed*3+1;
            } else {
                $mazed = $mazed/2;
            }
            print $mazed, " ";
    }

