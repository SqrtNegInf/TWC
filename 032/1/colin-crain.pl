#!/usr/bin/env perl

use warnings;
use strict;
use feature ":5.26";

## ## ## ## ## MAIN

my @args = @ARGV || 'example.txt';    ## only so we can run it from the editor
my $counter = {};

if ( -f $args[0] ) {
## its a list of files
    for my $file ( @args ) {
        open (my $fh, "<", $file);
        my @lines = <$fh>;
        close $fh;

        for my $line ( @lines ){
            chomp $line;
            $counter->{$line}++;
        }
    }
}
else {
## it's just a STDIN list of words
    my @lines = @args;
    for my $line ( @lines ){
        chomp $line;
        $counter->{$line}++;
    }
}

for my $key (sort keys $counter->%*)    {
    printf "%-10s %-d\n", $key, $counter->{$key};

}


