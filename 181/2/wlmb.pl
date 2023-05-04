#!/usr/bin/env perl
use v5.36;
use List::MoreUtils qw(pairwise);
use Date::Parse;
use DateTime;

my %temps;
open my $fh, '<', 'temperature.txt';
while($_= <$fh>){ # Input data from standard input in format YYYY-MM-DD, Temp
    chomp;
    my ($date, $temp)=split ", ";
    $temps{$date}=$temp;
}
my %datetimes;
for(keys %temps){ # check valid dates
    die "Wrong date $_" unless defined (my $time=str2time($_));
    $datetimes{$_}=DateTime->from_epoch($time); # Build DateTime object
}
my @sorted=sort {DateTime->compare($datetimes{$a}, $datetimes{$b})} keys %temps;
for(1..@sorted-1){
    die "Dates not consecutive"
        unless $datetimes{$sorted[$_]}->delta_days($datetimes{$sorted[$_-1]})->days==1;
    say $sorted[$_] if $temps{$sorted[$_]}>$temps{$sorted[$_-1]}
}
