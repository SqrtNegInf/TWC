#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

my $use_csv = 0;
my %counts;

# Increment the counts hash for each line
for my $line ( <DATA> ) {
    chomp($line);
    $counts{$line}++;
}

# Print the aggregated line items
for my $item (sort keys %counts) {
    if ($use_csv) {
        # Normally i'd use a module like Text::CSV
        print $item . ',' . $counts{$item};
    } else {
        printf("%-10s %d", $item, $counts{$item})
    }
    print "\n";
}

__END__
apple
banana
apple
cherry
cherry
apple
