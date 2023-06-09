#!/usr/bin/env perl
use v5.36;

my ($input, $EXAMPLE) = (28);

if    ($input =~ /^\d*$/) {
    say dec2excel($input);
}
elsif ($input =~ /^[A-Z]*$/) {
    say excel2dec($input);
}
else {
    say "input: decimal number or capital alphabetic sequence of characters A-Z";
}

$EXAMPLE && printf "%-2d  %-2s  %-2d  %-2s\n", $_, dec2excel($_),
                            excel2dec(dec2excel($_)), b26($_) for (1..90);


## ## ## ## ## SUBS:

sub dec2excel {
    my $num = shift;
    my @alpha = ( "A".."Z" );
    my $out = "";
    my $rem = 0;
    while ( $num > 0  ) {
        ## magic here, note we do the math on num - 1
        ($num, $rem) = (int( ($num-1)/26 ), ($num-1) % 26);
        $out = $alpha[$rem] . $out;
    }
    return $out;

}

sub excel2dec {
    my $excel = shift;
    my @alpha = ( "A".."Z" );
    my %alpha = map { $alpha[$_] => $_+1 } (0..25);

    my @rev_26 = reverse( map { $alpha{$_} } split //, $excel );

    my $out;
    for (0..@rev_26 - 1) {
        my $val = shift @rev_26;
        $out += $val * (26 ** $_);
    }
    return $out;
}
