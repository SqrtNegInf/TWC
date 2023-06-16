#!/usr/bin/env perl
use v5.36;

my @array = (0..10);
my $count = 0;
my %hash  = map {$_ => ++$count} 'a'..'j';

say "Array slice :  @array[3..7]";
say "Hash slice 1: ", join ' ', %hash{'b', 'd', 'c'};
say "Hash slice 2: ", join ' ', %hash{'b'..'d'};
say "Hash slice 3: ", join ' ', @hash{'b'..'d'};
say "Hash slice 4: ", join ' ', @hash{qw/c b c d/};

# Array slice a l-value
my @new_array = (1, 2);
@new_array[2, 3] = @array[6, 7];
say "New array: ";
print "new_array\n";
