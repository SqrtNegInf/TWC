#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

use lib ".";
use LonelyX;

sub Usage { "Usage: $0 path-to-matrix" };

my $Verbose = 0;
GetOptions("verbose" => \$Verbose);

my $path = 'board1.txt';

die Usage() unless $path;
die (Usage() ." ". $!) unless -r $path;

my $lx = LonelyX->new();
$lx->loadGrid($path);
$lx->showGrid() if ( $Verbose );

my $result = $lx->run();
say $result;

$lx->highlight() if ( $Verbose )
