#!/usr/bin/env raku

my $time = '17:50';
if $time ~~ /(<[ap]>)m/ {
    if $0 eq 'a'  {
        $time ~~ s/(\d\d':'\d\d).*/$0/;
    } else {
        $time ~~ s/(\d\d)':'(\d\d).*/{$0 + 12}:$1/;
    }
} else {
    $time ~~ /^(\d\d)':'(\d\d)/;
    my ($suffix, $hour) = $0 > 12 ?? ('pm', $0 - 12) !! ('am', $0);
    $time = "$hour:$1 $suffix";
}
say $time;
