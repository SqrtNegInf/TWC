#!/usr/bin/env perl
use v5.36;

use List::Util qw(min);
my ($current, @rest)=sort {$a <=> $b} map {to_minutes($_)} ("10:10", "09:30", "09:00", "09:55");
push @rest, $current + 24*60; # Add first time as last time, next day
my $min = min map {my $diff=$_-$current; $current=$_; $diff} @rest;
say join " ", @ARGV, "->", $min;

sub to_minutes($s){
    die "Wrong format, expected HH:MM: $s\n" unless $s=~/(\d\d?):(\d\d?)/;
    my ($hour, $min)=($1, $2);
    die "Hour should obey 0<=hour<24: $s" unless $hour<24;
    die "Minute should obey 0<=minute<60: $s" unless $min<60;
    return $hour*60+$min;
}
