#!/usr/bin/env perl
use v5.36;
use bigint;
use Math::Prime::Util qw(next_prime pn_primorial);
use Getopt::Lazy
    'help|h|?' => 'Show help screen',
    'Nf=i' => '*Number of Fortunates to generate',
    'Np=i' => 'Number of primorials to use',
    -summary => 'Generate lowest distinct fortunate numbers',
    -usage => '%c %o',
    ;
GetOptions;
show_help, exit if $help;
$Nf//=8;
$Np//=9;
my @primorial=map {pn_primorial($_)} (1..$Np) ; # start primorials in first prime
my @fortunate;
foreach(@primorial){
    push @fortunate, next_prime($_+1)-$_;
}
my %fortunate;
@fortunate{@fortunate}=(1)x@fortunate;
die "Didn't find enough disctinct Fortunate numbers; please increase Np\n"
        unless keys %fortunate>=$Nf;
say "The $Nf lowest distinct Fortunate numbers found are";
say join " ", @{[sort {$a<=>$b} keys %fortunate]}[0..$Nf-1];
