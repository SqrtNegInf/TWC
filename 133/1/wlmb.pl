#!/usr/bin/env perl
use v5.36;

say "√$_=", int_sqrt($_) foreach( (10, 9, 5) );
sub int_sqrt{
    my $x0=my $N=shift;
    return "Come on, let's get real" if $N<0;
    return $N if $x0==0;
    my $x1=(($N/$x0+$x0)/2); # initial guess
    ($x0,$x1)=($x1, (($N/$x1+$x1)/2)) while($x1<$x0);
    return $x0;
}
