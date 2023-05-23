#!/usr/bin/env perl
use v5.36;

my @list = (11, 2, 34, 65, 15, 3, 0);
my @sorted = sort {$a <= $b} (sort { $a <=> $b} @list);
my $list_len = @sorted;

print("Output: ");
for(my $i = 0; $i < $list_len; $i++) {
	print("$sorted[$i]");
}
print("\n");
