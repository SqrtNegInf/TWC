#!/usr/bin/env perl
use v5.36;

use constant PI=>3.14;

sub X {}
my ($x, @x, %x);
our ($X, @X, %X);
my %map=('$x'=>\$x, '@x'=>\@x, '%x'=>\%x, '$X'=>\$X, '@X'=>\@X, '%X'=>\%X, '&X'=>\&X, 'PI'=>\&PI);
foreach (sort keys %map){
    my $r=$map{$_};
    $r=~/\((.*)\)/;
    say "$_=>$1";
}
