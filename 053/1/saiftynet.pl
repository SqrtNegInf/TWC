#!/usr/bin/env perl
use v5.36;

# square matrix made of alphanumeric characters
my $matrix1=[[qw{1 2 3 4 5}],
             [qw{6 7 8 9 0}],
             [qw{A B C D E}],
             [qw{F G H I J}],
             [qw{K L M N O}]];
  
# unicode characters making a rectangular matrix
my $matrix2=[[qw{- - - █ - -}],
             [qw{- - - ░ █ -}],
             [qw{█ █ █ ░ ░ █}],
             [qw{- - - ░ █ -}],
             [qw{- - - █ - -}]];
           
foreach (qw/0 cw ht ccw h v lr rl/){
  print "\nRotating/flipping $_\n";
  printMatrix (flip($matrix1,$_)," "); 
}

foreach (0,90,180,270){
  print "\nRotating by $_\n";
  printMatrix (flip($matrix2,$_ ));
}

sub flip{
   my $arr=shift;
   my $direction=shift;
   my @flipped=();
   return $arr unless $direction ;             # return original list for 0 deg trun
   if ($direction=~/^cw|ccw|lr|rl|90|270$/){
     foreach my $row(0..scalar @{$$arr[0]}-1){ # for each row   
          $flipped[$row]=[];                   # initialise empty row
          foreach my $col(0..scalar @$arr-1){  # for each column
             push @{$flipped[$row]}, $$arr[$col][$row];  # this does a diagonal flip
          };
          @{$flipped[$row]}=reverse @{$flipped[$row]} if $direction =~/^cw|90|rl$/;
       }
     @flipped=reverse @flipped if $direction =~/^ccw|270|rl$/;
   }
   elsif ($direction eq 'v'){
        @flipped=reverse (@$arr)
   }
   elsif ($direction eq 'h'){
      my $row=0;
      foreach  (@$arr){
           @{$flipped[$row++]}= reverse @$_;
      };
   }
   elsif ($direction =~ /^180|ht$/){
        @flipped=@{flip(flip($arr,"v"),"h")};
   }  
   return \@flipped;
}

sub printMatrix{  # prints out a matrix with an appropriate separator
  my $matrix=shift;
  my $separator=shift // "";
  foreach my $r (@$matrix){ print "",(join $separator,@$r),"\n" };
}
