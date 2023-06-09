#!/usr/bin/env perl
use v5.36;

sub to_num  {
    (ord) - 64 + 26 * (&to_num||0) if $_ = chop @_
}
sub to_exl {
    $% = pop;
    while ($%>26) {
        $" = chr (64 + $% - 26*($% /= 26)) . $";
    }
    chr(64 + $%).$"
}
my $excelcol = uc ($ARGV[0]||2708874);

if ($excelcol=~/\D/) {
    say to_num($excelcol);
} else {
    say to_exl($excelcol);
}
