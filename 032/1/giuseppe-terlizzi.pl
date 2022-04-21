#!/usr/bin/env perl

use strict;
use warnings;

use v5.10;
use Getopt::Long;

open my $fh, '<', 'example.txt';
my $csv = 0;
my %data;

GetOptions("csv" => \$csv);

sub collect {

    while (<$fh>) {

        my $line = $_;
        chomp($line);

        $data{$line}++;

    }

    close $fh;

}

if (@ARGV) {

    foreach (@ARGV) {
        die "Input file not found ($_)\n" unless (-f $_);
        open $fh, '<', $_ or die ("$?\n");
        collect $fh
    }

} else {
    collect $fh;
}

foreach my $item (sort { $data{$b} <=> $data{$a} } keys %data) {
    printf "%s%s%s\n", $item, ($csv ? "," : "\t"), $data{$item};
}
