#!/usr/bin/env perl
use v5.36;

use English;

my @data;

# Read data from STDIN
open my $fh, '<', 'temperature.txt';
while($_ = <$fh>){
    # Strip trailing newline; skip
    # blank lines
    chomp;
    next
        if($_ eq "");

    # Store the date and temperature, after splitting
    # the text into fields and stripping extraneous
    # whitespace from each
    push(@data, [ map({ $_ =~ s/\s//g; $_; } split(/,/, $_)) ]);
}

# Sort the data in ascending order by date
@data = sort({ $a->[0] cmp $b->[0] } @data);

# Loop from the second day to the end of the list,
# outputting dates whose temperature is greater
# than that of the previous
for my $i (1 .. $#data){
    print($data[$i][0], "\n")
        if($data[$i][1] > $data[$i - 1][1]);
}
