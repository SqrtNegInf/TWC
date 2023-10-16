#!/usr/bin/env perl
use v5.36;

use List::Util qw(product all);
use POSIX qw(floor);

sub steps($x){
    my $result=0;
    ++$result , $x=product split "", $x
	while($x>=10);
    $result
}
@ARGV = (15, 99, 1, 34);
die <<~"FIN" unless @ARGV;
    Usage: $0 N1 [N2...]
    to sort the list N1 N2 according to the number of steps required
    to bring the number to one digit and then according to value
    FIN
die "Only natural numbers allowed" unless all {0<=floor($_)&&floor($_)==$_} @ARGV;
say "@ARGV -> ", join " ",
    sort {steps($a)<=>steps($b)||$a<=>$b} @ARGV
