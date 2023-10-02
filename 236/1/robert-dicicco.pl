#!/usr/bin/env perl
use v5.36;

my @bills = ([5, 5, 5, 10, 20], [5, 5, 10, 10, 20],[5, 5, 5, 20]);

for my $chg (@bills) {
    say "Input: \@bills = [@$chg]";
    my $ln = scalar @$chg;
    my $cnt = 0;
    my $change = 0;
    while ($cnt < @$chg) {
        my $ticket = $chg->[$cnt];
        my $change_required = $ticket - 5;
        if ($ticket == 5){
            $change += 5;
        } elsif ($ticket == 10) {
            $change -= 5;
            $change += 5;
        } elsif ($ticket == 20) {
            if ($change_required > $change){
                say "Output: false\n";
                last;
            } else {
                say "Output: true\n";
                last;
            }
            $change -= 15;
            $change += 5;
        }
        $cnt++;
    }
}
