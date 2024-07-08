#!/usr/bin/env perl

use feature 'signatures';

testMe(\&process, 'Example1', [1, 2, 2, 4, 1, 5], 4);
testMe(\&process, 'Example2', [1, 2, 3, 4, 5], 5);
testMe(\&process, 'Example3', [1, 2, 2, 3, 2, 4, 6, 5, 5], 3);

sub testMe {
    my $processor = shift;
    my $name = shift;
    my $input = shift;
    my $expectedValue = shift;

    my $got = &$processor(@$input);

    if ( $got==$expectedValue ) {
        print "[OK ] $name\n";
    }
    else {
        print "[ERR] $name :: got=$got, expectedValue=$expectedValue\n";
    }

}

sub process {
    my @input = @_;

    my $len = @input;

    my $result = 0;

    my $map = {};

    for(my $i=0; $i < $len; ++$i) {
        $map->{$input[$i]}++;
    }

    my $maxValue = (sort { $b <=> $a } values %$map)[0];

    foreach my $key (@input) {

        my $value = $map->{$key};

        if ( $value == $maxValue ) {
            ++$result;
        }

    }

    return $result;
}



