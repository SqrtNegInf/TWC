#!/usr/bin/env perl
use v5.36;

use Scalar::Util qw(looks_like_number);
use POSIX qw(floor);

foreach my $N(1234){
    die "Usage: ./ch-1.pl n m ... with positive integer arguments"
	  unless looks_like_number $N and $N>=0 and $N==floor $N;
    say "Input: $N, Output: ", palindrome(split '', $N+1);
}
sub palindrome {
    my @digits=@_;
    return @digits if @digits==1;
    return ($digits[0]) x 2 if @digits==2 and $digits[0]>=$digits[1];
    return ($digits[0]+1) x 2 if @digits==2 and $digits[0]<$digits[1];
    return ($digits[0], palindrome(@digits[1..@digits-2]), $digits[0])
	  if $digits[0]>=$digits[-1];
    my @M=palindrome(split('', join('', @digits[1..@digits-2])+1));
    return ($digits[0],@M,$digits[0]) if @M==@digits-2;
    return ($digits[0]+1, ((0)x(@digits-2), $digits[0]+1));
}
