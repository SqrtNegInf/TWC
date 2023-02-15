#!/usr/bin/env perl
use strict; use warnings; #yes mom

if( @ARGV ){ printf "Special quadruplets: %d\n", count_special_quad(@ARGV) }
else       { run_tests() }
exit;

sub comb { my($l,$k,$s)=(@_,0); $k ? map {my $i=$_; map[$$l[$i],@$_], comb($l,$k-1,$i+1) } $s..@$l-$k : [] }
sub is_special_quad { my( $a, $b, $c, $d ) = @_; $a + $b + $c == $d }
sub count_special_quad { 0 + grep is_special_quad(@$_), comb([ @_ ], 4) }

sub run_tests {
    for my $test (
	[1,2,3,6   => 1],
	[1,1,1,3,5 => 4],
	[3,3,6,4,5 => 0],
	[1..10     => 11],
	[1..34     => 865],
    ){
	my $exp = pop @$test;
	my @input = @$test;
	my $got = count_special_quad(@input);
	printf "%-6s input: %-20s   expected: %d   got: %d\n",
	    $exp==$got ? 'ok': 'NOT OK',
	    "@input",
	    $exp,
	    $got
    }
}

