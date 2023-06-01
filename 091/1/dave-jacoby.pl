#!/usr/bin/env perl
use v5.36;

my @examples = qw{1122234 2333445 12345 90125 };

for my $example (@examples) {
    my $output = count_number($example);
    my $o2     = count_number2($example);
    say '  input: ' . $example;
    say ' output: ' . $output;
    say 'output2: ' . $o2;
    say '';
}

sub count_number( $input ) {
    my $output = '';
    for my $i ( 0 .. 9 ) {
        my $x = () = $input =~ /($i)/gmx;
        $output .= $x . $i if $x;
    }
    return $output;
}

sub count_number2( $input ) {
    return join '', map {
        my $x = () = $input =~ /($_)/g;
        $x . $_; }
        grep { $input =~ /$_/ } 0 .. 9;
}
