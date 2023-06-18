#!/usr/bin/env perl
use v5.36;

my $stones = shift || "chancellor";
my $jewels = shift || "chocolate";

$stones =~ s/[^a-zA-Z]//g;  
$jewels =~ s/[^a-zA-Z]//g;  

my $exp = join('|',split(//,$stones));
my $count = () = $jewels =~ /$exp/g;
print "$count\n";
