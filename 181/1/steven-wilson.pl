#!/usr/bin/env perl

use strict;
use warnings;
use feature qw/ say /;
use String::Util qw/ trim /;

my $input
    = "All he could think about was how it would all end. "
    . "There was still a bit of uncertainty in the equation, "
    . "but the basics were there for anyone to see. No matter "
    . "how much he tried to see the positive, it wasn't anywhere "
    . "to be seen. The end was coming and it wasn't going to be pretty.";
say order_sentences($input);

sub order_sentences {
    my $input    = shift;
    my @sentence = map { trim($_) } split /\./, $input;
    my $output;

    foreach (@sentence) {
        $output .= join " ",
            sort { no warnings; $a <=> $b; "\L$a" cmp "\L$b" } split /\s+/,
            $_;
        $output .= ".  ";
    }
    trim($output);
}
