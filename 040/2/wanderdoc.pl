#!/usr/bin/env perl
use v5.36;


my @array = (10, 4, 1, 8, 12, 3);
my @idx2sort = (0, 2, 5);

my %val2sort;

@val2sort{@idx2sort} = @array[@idx2sort];

my @idx_stack = sort {$a <=> $b } values %val2sort;

my @new_array;
for my $i ( 0 .. $#array )
{
     $new_array[$i] = exists $val2sort{$i} ?
          shift @idx_stack : $array[$i];

}

print join(', ', @new_array), $/;



print "Now saving indices not values:", $/;

@new_array = ();

my @idx_sorted = 
     sort {$val2sort{$a} <=> $val2sort{$b}} keys %val2sort;



for my $i ( 0 .. $#array )
{
     $new_array[$i] = exists $val2sort{$i} ?
          $array[shift @idx_sorted] : $array[$i];
}

print join(', ', @new_array), $/;
