#!/usr/bin/env perl
use v5.36;

my %hash;

my @ints = ([2, 1, 3, 2],[1, 1, 1, 1],[2, 1, 3, 4]);

sub CreateHashValues($h) {
   %hash = ();
   my $ln = scalar(@$h);
   my $cnt = 0;
   while ($cnt < scalar @$h) {
       if(! exists $hash{$h->[$cnt]}) {
           $hash{$h->[$cnt]} = 1;
       } else {
           $hash{$h->[$cnt]}++;
       }
       $cnt++;
   }
}


sub FindUniqueSum() {
    my $flag = 0;
    my $sum = 0;
    for my $key (keys %hash) {
        $sum += $key if ($hash{$key} == 1);
    }
    say "Output: ",$sum,"\n";
    %hash = ();
}

for my $x (@ints) {
    say "Input: \@int = [@$x]";
    CreateHashValues(\@$x);
    FindUniqueSum;
    }
