#!/usr/bin/env perl
use v5.30.3;
use warnings;
use strict;

use Getopt::Long;
use Pod::Usage;
use Data::Dumper;

my $man = 0;
my $help = 0;
my $str_input;
GetOptions ('help|?' => \$help, man => \$man,
	    "nums=s" => \$str_input
    )
    or pod2usage(2);

pod2usage(1) if $help;
pod2usage(-exitstatus => 0, -verbose => 2) if $man;

# Prepare input array
my @int;
# if values provided at cmd line split on comma
if ( $str_input ) {
    say reverse_pairs(split(/,/, $str_input));    
}
# else set default values from example if no cmd line input
else {
    # Example 1
    @int = (8, 1, 2, 2, 3); 
    say count_smaller(@int);

    # Example 2
    @int = (6, 5, 4, 8);
    say count_smaller(@int);

    # Example 3
    @int = (2, 2, 2);
    say count_smaller(@int);    
}

sub count_smaller {
    my @int = @_;
    my @int_out;

    # Loop through each number in array to count how many numbers are smaller than it
    for (my $i=0; $i < @int; $i++) {
	$int_out[$i] = 0; #default is no number is smaller than it
	# check each number in the array except for self
	for (my $j=0; $j < @int; $j++) {	
	    $int_out[$i]++ if ($int[$i] > $int[$j] && $i != $j);
	}
    }

    # Return the @output array in the desired format
    $Data::Dumper::Terse = 1; #don't print VAR names
    $Data::Dumper::Indent = 0; #keep output on one line
    return '(' . join(',', Dumper(@int_out)) . ')';
}
