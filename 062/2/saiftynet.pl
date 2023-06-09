#!/usr/bin/env perl
use v5.36;

my $side=4;                               # number of squares per side 
my @grid;
$grid[$side-1][$side-1][$side-1]=undef;   # initialise 3d grid

print "\n";

tryAll();

sub tryAll{
 my $numberOfQueens=0;
 foreach my $x (0..$side-1){
    foreach my $y (0..$side-1){
      foreach my $z (0..$side-1){
        $numberOfQueens+= placeQueen($x,$y,$z);;
      }
    }
  }
  print "Number of queens in a $side x $side x $side grid is $numberOfQueens\n";
  printGrid();
  
}

# places a queen aa given 3d position if not occupied 
# puts a "." in all places that the queen may strike at
sub placeQueen{   
   my ($x,$y,$z)=@_;
   ($x,$y,$z) = @$x if (ref $x eq "ARRAY");
   return 0 if $grid[$x][$y][$z];  # if occupied or targetted return fail
   $grid[$x][$y][$z]="Q";
   
   # in each of the possible directions 
   foreach my $deltaX(-1..1){
     foreach my $deltaY(-1..1){
       foreach my $deltaZ(-1..1){
          next unless $deltaX or $deltaY or $deltaZ; # ignore "all zero" direction.
          foreach my $distance (1..$side-1){         # for distances in that direction
            my ($testX,$testY,$testZ)=($x+$distance*$deltaX,
                                       $y+$distance*$deltaY,
                                       $z+$distance*$deltaZ);
            last if outOfBounds($testX,$testY,$testZ);  # ignore if out of bounds
                                                     # place a dot at targetted  squares
            $grid[$testX][$testY][$testZ]="." unless $grid[$testX][$testY][$testZ];
          }
       }
     }
   }
   return 1;  # successfuly placed a queen
   
   sub outOfBounds{    # test for bounds 
     my ($x,$y,$z)=@_;
     return 1 if $x < 0      or $y < 0      or $z < 0 or  
              $x >= $side or $y >= $side or $z >= $side;
     return 0;
  }
}

# prints a 3d ish grid;
# for sides larger than 5 the grid is printed vwith vertical pages
# for less than 5 the pages are displayed horizontally
sub printGrid{
  if ($side<=5){ 
    print "",(("_"x($side*2)).(" "x4))x$side,"\n";
    foreach my $x (0..$side-1){
      print " "x$x;
      foreach my $y (0..$side-1){
        foreach my $z (0..$side-1){
          print "\\",($grid[$x][$y][$z]//".");
        }
        print "\\"," "x3;
      }
      print "\n";
    }
     print " "x$side,(("-"x($side*2)).(" "x4))x$side,"\n";
  }
  else{
    foreach my $x (0..$side-1){
      foreach my $y (0..$side-1){
        print " "x$y;
        foreach my $z (0..$side-1){
          print "\\",($grid[$x][$y][$z]//".");
        }
        print "\\\n";
      }
      print "\n";
    }
  }
}

