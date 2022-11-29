#!/usr/bin/env perl

use v5.36;

use List::Util qw(sum reduce all);

my @current=(1, 0, 5);
my $result=0;
if((sum @current)%@current){
    $result=-1
} else {
    ++$result while transfer()
}
say join " ", @ARGV, "->", $result;
sub transfer{ # transfers one unit to reduce largest difference. Returns +-1 on success 0 on failure
    return 0 if @current<=1; # nothing to do
    my @diff=map {$current[$_+1]-$current[$_]} 0..@current-2;
    my $index=reduce {abs($diff[$a])<abs($diff[$b])?$b:$a} 0..@diff-1; # Find max diff
    my $sign=$diff[$index]>0?-1:$diff[$index]<0?1:0; # direction of transfer: left(-1) or right(+1))
    @current[$index,$index+1] = map {$sign=-$sign; $_+$sign} @current[$index, $index+1]; #update
    return $sign;
}
