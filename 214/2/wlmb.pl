#!/usr/bin/env perl

use v5.36;
my @list= (2,4,3,3,3,4,5,4,2);
my $first=shift @list;
my @current=($first, 1);  # nodes are of the form [value, count]
my @nodes;
for(@list){
    push(@nodes, [@current]), @current=($_, 0) unless $current[0] eq $_; # New node if value changes
    $current[1]++;
}
push @nodes, [@current]; # array of pairs [value, count]
# remove all groups with different starting group and choose largest score
my @points = sort {$b <=> $a} map {remove($_, \@nodes)} 0..@nodes-1;
my $points=$points[0]; # largest score
say "$points";

# Get max points after removing all $remaining nodes starting from $which
sub remove($which, $remaining){
    my @copy=@$remaining;
    my $points = $copy[$which][1]**2;
    # join neighbor groups if possible
    $copy[$which-1]=[$copy[$which-1][0],$copy[$which-1][1]+$copy[$which+1][1]],
	splice @copy, $which+1,1
        if 0<$which<@copy-1 && $copy[$which-1][0] eq $copy[$which+1][0];
    splice @copy, $which, 1;
    my @points= sort {$b <=> $a} map {remove($_, \@copy)} 0..@copy-1;
    $points += $points[0] if @points;
    return $points;
}
