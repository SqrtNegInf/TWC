#!/usr/bin/env perl
use v5.36;

sub missing_row ($file) {
   open my $fh, '<', $file or die "open('$file'): $!\n";
   my %all = map {$_ => 1} 1 .. 15;
   delete $all{s{\A (\d+) .*}{$1}rmxs} while <$fh>;
   return keys %all;
}

say missing_row('example.txt');
