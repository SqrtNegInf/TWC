#!/usr/bin/env raku
my %hash;

my @ints = ([2, 1, 3, 2],[1, 1, 1, 1],[2, 1, 3, 4]);

sub CreateHashValues(@h) {
   %hash = ();
   my $ln = @h.elems;
   my $cnt = 0;
   while $cnt < $ln {
       %hash{@h[$cnt]} += 1;
       $cnt++;
   }
}

sub FindUniqueSum() {
    my $flag = 0;
    my $sum = 0;
    for (keys %hash) -> $key {
        $sum += $key if (%hash{$key} == 1);
    }
    say "Output: ",$sum,"\n";
    %hash = ();
}

for (@ints) -> @h {
    say "Input: \@int = ",@h;
    CreateHashValues(@h);
    FindUniqueSum();
}
