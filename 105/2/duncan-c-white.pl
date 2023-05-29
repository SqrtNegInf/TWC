#!/usr/bin/env perl
use v5.36;

use Function::Parameters;
use Getopt::Long;
use Data::Dumper;

my $debug=0;
#die "Usage: the-name-game [--debug] name\n"
#	unless GetOptions( "debug" => \$debug ) && @ARGV==1;

my $name = shift// 'Katie';

my $y = lc($name);
$y =~ s/^([bcdfghjklmnpqrstvwxyz])//;
my $deleted = $1 // '';

my $by = $deleted eq 'b' ? $y : "b$y";
say "$name $name bo-$by";
my $fy = $deleted eq 'f' ? $y : "f$y";
say "Bonana-fanna fo-$fy";
my $my = $deleted eq 'm' ? $y : "m$y";
say "Fee fi mo-$my";
say "$name";
