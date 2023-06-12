#!/usr/bin/env perl
use v5.36;

srand 1;

use strict; use warnings;
my @list=();
foreach (0..10){                              # random interval generator
    my $start=int(80*rand());
    my $end=$start+int(10*rand()+2);
    push @list,[$start,$end];
}

print "Before Merging:-\n",                   
      (join ",",map{"[$$_[0],$$_[1]]"} @list),# Prints the initial list
       "\n"; 
@list=mergeIntervals(@list);                  # Merge the list
print "After Merging:-\n",                    
      (join ",",map{"[$$_[0],$$_[1]]"} @list),# Print the list post merger
      "\n\n"; 

# The mergeIntervals takes a list of intervals, sorts them and merges where possible
sub mergeIntervals{
  my @toMerge=sort {$$a[0]<=>$$b[0]} @_;      # sort intervals on the intervals' start
    
  my $pointer=our $merges=0;                    
  while ($pointer<$#toMerge){                 # check two adjacent intervals for merging
         splice @toMerge,$pointer,2,merge($toMerge[$pointer],$toMerge[$pointer+1]);
         $pointer++ unless $merges;           # unless merging can move to next set
         $merges=0;                           # reset merges flag
   }
  return @toMerge;
    
  sub merge{          # for sorted pair, pair will merge if start of second is
    my ($a,$b)=@_;    # less or equal to end of first. When a merge happens,
		              # start is the start of first, and end is the largest
		              # of either ends
    return ([$$a[0], $$a[1]>$$b[1]?$$a[1]:$$b[1]])
         if  $$a[1]>=$$b[0] and $merges=1;   # a merge happens and is flagged
    return ($a,$b);                          # if not merged, returns the pair
  }
}

