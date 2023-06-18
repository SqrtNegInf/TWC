#!/usr/bin/env perl
use v5.36;

my $cmd_line_arg = "Perl {Daily,Weekly,Monthly,Yearly} Challenge";
say "The command line argument \"$cmd_line_arg\" should expand to:";

if ( $cmd_line_arg =~ m/\{([\w\,]*)\}/ ) {
    my @items = split /,/, $1;
    for my $item (@items) {
        my $string = $cmd_line_arg;
        $string =~ s/\{[\w\,]*\}/$item/;
        say $string;
    }
}

