#!/usr/bin/env perl
use v5.36;

my @aMatrix = ([1,2,3],[4,5,6],[7,8,9]);
print "Matrix\n";
drawMatrix(\@aMatrix);


my @aMatrixRotated90 = rotateMatrix(\@aMatrix, 90);
print "Matrix rotated 90 degrees clockwise\n";
drawMatrix(\@aMatrixRotated90);

my @aMatrixRotated180 = rotateMatrix(\@aMatrix, 180);
print "Matrix rotated 180 degrees clockwise\n";
drawMatrix(\@aMatrixRotated180);

my @aMatrixRotated270 = rotateMatrix(\@aMatrix, 270);
print "Matrix rotated 270 degrees clockwise\n";
drawMatrix(\@aMatrixRotated270);

sub rotateMatrix {
    my $refMatrix = shift;  
    my $degrees = shift;
    my @aMatrixRotating =@{$refMatrix};
    while ( $degrees / 90 >= 1  ) {
        @aMatrixRotating = rotateMatrix90Degrees(\@aMatrixRotating);
        $degrees -= 90;
    }
    return @aMatrixRotating;    
}

sub rotateMatrix90Degrees {
    my $refMatrix = shift; 
    my @aNewMatrix = ();
    foreach my $x (0..$#{$refMatrix}){
        foreach my $y (0..$#{$$refMatrix[$x]}){
            $aNewMatrix[$y][$#aMatrix - $x]  = $$refMatrix[$x][$y]  ;
        }
    }
    return @aNewMatrix;
}

sub drawMatrix {
    my $refMatrix = shift;    
    foreach my $row (@{$refMatrix}){
        print "[ ".join(', ',@{$row}). " ]\n";
    }
}
