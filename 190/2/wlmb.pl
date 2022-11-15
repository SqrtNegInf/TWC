#!/usr/bin/env perl

use v5.36;
use experimental qw(try);

my @letters=("", "A".."Z"); # Base 1 array of ascii letters
sub iterator($n){ #Create an iterator for all decodings of the number $n
    my $counter=0;
    my $length=length $n; # number of digits
    my @digits0=split "", $n;
    sub {
        COUNTER: while($counter<2**$length){
            my @digits=@digits0; # copy digits
            my @bits=split "",
                my $bits=sprintf "%0.${length}b", $counter++; # convert to binary, advance counter
            next COUNTER if $bits=~/11/; # Don't stick more than 2 consecutive letters
            my @output;
            while(@bits && @digits){
                my $bit=pop @bits;
                next COUNTER if @digits<2 && $bit==1; # Not enough digits to join
                splice(@digits,-2,2,$digits[-2].$digits[-1]),next if $bit==1; # Join last two digits
                unshift @output, my $m=pop @digits if $bit==0; # or pop last number
                next COUNTER if $m==0 or $m>=@letters; # Number too large or too small, restart
            }
            return @letters[@output]; # Found a decoding. Convert numbers to letters and return them
        }
        (); # Didn't find another decoding, return a null list
    }
}

for(1115){
    try {
	die "Only digits allowed: $_" unless /^\d*$/;
        die "Empty input" unless /./;
	my $it=iterator($_);
	print "$_ -> ";
	my @decoded;
	print @decoded," " while(@decoded=$it->()); # Print all possible decodings
	say "";
    }
    catch($m){
        say "Error: $m";
    }
}
