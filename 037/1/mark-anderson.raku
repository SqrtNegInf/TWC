#!/usr/bin/env raku

#use Date::Names; # 2022-06-03 this is just trouble lately...

my $dt = DateTime.new(year => 2019, month => 1);
#my $dn = Date::Names.new;

while ($dt.year == 2019) {
    my $count = 0;
    my $mon = $dt.month;
    #my $mon = $dn.mon($dt.month, 3);

    while ($dt.month eq $mon) {
    #while ($dn.mon($dt.month, 3) eq $mon) {
        if ($dt.day-of-week < 6) {
            $count++;
        }

        $dt = $dt.later(:day1);
    }

    say "$mon:$count days";
}
