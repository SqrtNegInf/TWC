#!/usr/bin/env raku
# 2022-06-05 new 2.2.3 release works
# 2022-06-03 fails here, works on Ubuntu

use Date::Names; 

my $dn = Date::Names.new;
my $dt = DateTime.new(year => 2019, month => 1);

while ($dt.year == 2019) {
    my $count = 0;
    my $mon = $dn.mon($dt.month, 3);

    while ($dn.mon($dt.month, 3) eq $mon) {
        if ($dt.day-of-week < 6) {
            $count++;
        }

        $dt = $dt.later(:day1);
    }

    say "$mon:$count days";
}
