#!/usr/bin/env perl
use v5.36;

# demos 3 modes
# 1) without commentary
print "\n   ". rotateString("xyxx"),                    " rotations required.\n";

# 2) with commentary 
print "\n   ". rotateString("I am spinning around!",1), " rotations required.\n";

# 3) decorated commentary if Terminal accepts ANSI escape codes
print "\n   ". rotateString("Madam I am Adam",1,1),     " rotations required.\n";

sub rotateString{
  my ($origStr,$verbose,$colour)=@_;
  # if $verbose defined and true then outputs transforms
  # if $verbose and $colour are true then colour transforms
  my $workStr=$origStr;
  my $count=0;       # count of moves
  do{                # do means loop run at least once
    $count++;
    print "\n$count $workStr -> " if $verbose;   # before rotation
    $workStr=($colour?"\e[31m":"").substr($workStr,$count%length $workStr).  
             ($colour?"\e[32m":"").substr($workStr,0,$count%length $workStr).
             ($colour?"\e[0m" :"");
    print $workStr if $verbose;
    $workStr=~s/\e\[[^m]+m//g;
    
  }while($origStr ne $workStr);
  return $count;
}

