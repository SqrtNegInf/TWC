#!/usr/bin/env perl
use v5.36;

#Inputs
my @NList = (11, 13, 15, 17);
my $N = 19;

#Call the function to search in the array 
findNumber();

#If the target isn't in the array, the target will be added into the array and the "new array" will be sorted. Then, call the search function (with the new array)
if (findNumber() == -1 ) {
    push @NList, $N;
    my @sorted = sort { $a <=> $b } @NList;
    @NList = @sorted;
    findNumber();
}

#Print the position of target inside the array
print (findNumber()."\n");

#Function to check if the target is in the array
sub findNumber{
    
    #walk through the array
    foreach (my $i=0; $i <@NList; $i++){
        #If the target is in the array, it will return its position
        if ($NList[$i] == $N) {
            return $i;
        }
    }
    return -1;
}
