#!/usr/bin/env perl
use v5.36;

sub flat {
    return map { ref eq 'ARRAY' ? flat(@$_) : $_ } @_;
}

my @matrix = [[1,2,3],
              [4,5,6],
              [7,8,9]];


my $width = 0;
my @rawNums = ();

@rawNums = flat @matrix;

for (my $w=1; $w**2 <= scalar @rawNums; ++$w) {
    if ($w**2 == scalar @rawNums) {
        $width = $w;
    }
}

my $deg;
my $errorString = "Invalid choice. There are modes for 0, 90, 180, 270 degree rotations.\n";

    $deg = 90;

if ($deg !~ m{\A[012789]+\Z}) {
    print STDERR $errorString;
    exit(1);
}

if ( not ($deg == 0 or $deg == 90 or $deg == 180 or $deg == 270)) {
    print STDERR $errorString;
    exit(1);
}

my @newMatrix = ();
my $i = 0;

if ($deg == 0) {

    for (my $j = 0; $j < $width; ++$j) {
        for (my $k = 0; $k < $width; ++$k) {
            $newMatrix[$j][$k] = $rawNums[$i++];
        }
    }

} elsif ( $deg == 90 ) {

    for (my $j = $width-1; $j >= 0; --$j) {
        for (my $k = 0; $k < $width; ++$k) {
            $newMatrix[$k][$j] = $rawNums[$i++];
        }
    }

} elsif ( $deg == 180 ) {

    for (my $j = $width-1; $j >= 0; --$j) {
        for (my $k = $width-1; $k >= 0; --$k) {
            $newMatrix[$j][$k] = $rawNums[$i++];
        }
    }

} elsif ( $deg == 270 ) {

    for (my $j = 0; $j < $width; ++$j) {
        for (my $k = $width-1; $k >= 0; --$k) {
            $newMatrix[$k][$j] = $rawNums[$i++];
        }
    }

}

foreach my $row (@newMatrix) {
    my $format = 0;
    foreach my $element (@$row) {
        if ($format == 0) {
            print "[", $element, ",";
        } elsif ($format == 1) {
            print " ", $element, ",";
        } elsif ($format == 2) {
            print " ", $element, "]";
        }
        ++$format;
    }

    print "\n";
}
