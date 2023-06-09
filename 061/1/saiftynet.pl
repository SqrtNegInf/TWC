#!/usr/bin/env perl
use v5.36;

srand 1;

maxProductSubArray(randList())  foreach (0..3);

sub maxProductSubArray{
  my @inputList=@_;    # list toptrocess may be either passed directly
                       # or as reference to a list
  @inputList=@{$inputList[0]} if (ref $inputList[0]);
  
  my %stats=(start=>0,end=>1,prod=>0); # hash to store best segment
  
  foreach my $start (0..$#inputList-1){
    my $prod=$inputList[$start];
    foreach my $end ($start+1..$#inputList){
       $prod*=$inputList[$end];
       # print "   (",join (",",@inputList[$start..$end]),") gives $prod\n";
       @stats{qw/start end prod/}=($start,$end,$prod)  if $stats{prod}<$prod;
	}
  }
  print "\nInitial List :- [",join (", ",@inputList), "]\n";
  print "Maximum contiguous product : - [",
        join (", ",@inputList[$stats{start}..$stats{end}]),
        "] \nGiving $stats{prod} \n";
}


# generate random lists of randon lengths to try
sub randList{
	my @list=();
	foreach (0..rand()*4+4){
		push @list,((int (rand()*30))/2)-5 ;
	}
	return @list;
}

