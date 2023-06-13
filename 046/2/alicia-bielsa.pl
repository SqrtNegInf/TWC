#!/usr/bin/env perl
use v5.36;

my $TOTAL = 500;
my @aRooms =  (0) x $TOTAL;	
foreach my $employee (1..$TOTAL){
    foreach my $door ($employee..$TOTAL){ 
        if ($door % $employee == 0 ){            
            $aRooms[$door-1] = flipStatus ($aRooms[$door-1]);
        }
    }
}

foreach my $room (0..$#aRooms){
    if ($aRooms[$room]){
        $room ++;
        print "Room $room opened\n";    
    }
}
sub flipStatus {
    my $status = shift;
    if ($status){
        return 0;
    } 
    return 1;
}
