#!/usr/bin/env raku

my $t = 0;
my $k = 1;
while ($t < 1) {
    $k++;
    if $k ~~ /<[6789]>/ {
        if (check_good("1"~$k, Array(2,3,4,5,6))) {
            $t++;
            say "1"~$k;
        }
    }
}


sub check_good ($i, @arr) {
    my $count = 0;
    my $dc = arrange($i);
    for (@arr) {
        if (arrange($_*$i) eq $dc) {
            $count++;
        } 
        else {
            last;
        }
    }
    return $count == @arr.elems;
}

sub arrange ($i) {
    return $i.split("").sort.join("");
}
