#!/usr/bin/env perl
use v5.36;

my $filename = "temperature.txt";
my %data;
my @dates_sorted;
my @dates_hotter;

open( my $fh, "<", $filename )
    or die "Can't open < input.txt: $!";

while ( my $line = <$fh> ) {
    $line =~ m/(\d+-\d+-\d+), (\d+)/g;
    $data{$1} = $2;
}

@dates_sorted = sort keys %data;
my $num_of_dates = scalar @dates_sorted;

for ( my $i = 1; $i < $num_of_dates; $i++ ) {
    if ( $data{ $dates_sorted[$i] } > $data{ $dates_sorted[ $i - 1 ] } ) {
        push @dates_hotter, $dates_sorted[$i];
    }
}

foreach (@dates_hotter) {
    say $_;
}

