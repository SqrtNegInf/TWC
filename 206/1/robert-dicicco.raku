#!/usr/bin/env raku

my @times = (["00:00", "23:55", "20:00"],["01:01", "00:50", "00:57"],["10:10", "09:30", "09:00", "09:55"]);

sub ToMins(@tm) {
    if (@tm[0] eq "00:00") { @tm[0] = "24:00"};
    if (@tm[1] eq "00:00") { @tm[1] = "24:00"};
    my ($hrs, $mins) = split(":",@tm[0]);
    my $t0_mins = ($hrs * 60) + $mins;
    ($hrs, $mins) = split(":",@tm[1]);
    my $t1_mins = ($hrs * 60) + $mins;
    return(abs($t0_mins - $t1_mins));
}

for (@times) -> @tm {
    print("Input: \@time = \(",@tm,"\)\n");
    my $shortest = 1441;
    for (0..@tm.elems-1).combinations: 2 -> @res {
        my @arr =();
        @arr.push(@tm[@res[0]]);
        @arr.push(@tm[@res[1]]);
        my $diff = ToMins(@arr);
        if $diff < $shortest {
            $shortest = $diff;
        }
    }
    print("Output: $shortest\n\n");
}
