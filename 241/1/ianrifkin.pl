#!/usr/bin/env perl
use v5.36;

# Example 1
my @nums = (0, 1, 4, 6, 7, 10);
my $diff = 3;
find_triplets($diff, \@nums);
    
# Example 2
@nums = (4, 5, 6, 7, 8, 9);
$diff = 2;
find_triplets($diff, \@nums);

sub find_triplets {
    my ($diff, $nums) = @_;
    my $nums_length = scalar @{$nums};
    my $total_finds = 0;
    for (my $i = 0; $i < $nums_length - 2; $i++) {    
	for (my $j = $i + 1; $j < $nums_length - 1; $j++) {
	    for (my $k = $j + 1; $k < $nums_length; $k++) {
		if (@{$nums}[$j] - @{$nums}[$i] == $diff && @{$nums}[$k] - @{$nums}[$j] == $diff) {
		    $total_finds++;
		}
	    }
	}
    }
    print "$total_finds\n";
}

