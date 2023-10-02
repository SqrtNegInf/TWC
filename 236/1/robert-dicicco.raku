#!/usr/bin/env raku

my @bills = ([5, 5, 5, 10, 20], [5, 5, 10, 10, 20],[5, 5, 5, 20]);

for (@bills) -> @chg {
    say "Input: \@bills = ",@chg;
    my $cnt = 0;
    my $change = 0;
    while ($cnt < @chg.elems) {
        my $ticket = @chg[$cnt];
        my $change_required = $ticket - 5;
        if $ticket == 5 {
            $change += 5;
        } elsif $ticket == 10 {
            $change += 0;
        } elsif $ticket == 20 {
            if $change_required > $change {
                say "Output: false\n";
                last;
            } else {
                say "Output: true\n";
                last;
            }
            $change -= 10;
        }
        $cnt++;
    }
}
