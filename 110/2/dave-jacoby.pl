#!/usr/bin/env perl
use v5.36;

use Carp;
use JSON;
use Text::CSV qw( csv );

my $json = JSON->new;
my $file = 'example.csv';

my $obj = read_csv($file);
printf "%s\n", join ',', @$_ for @{transpose_csv($obj)};
#write_csv( $file, $jbo );

sub read_csv($file) {
    croak unless -f $file;
    my $object = csv( in => $file );
    return $object;
}

sub transpose_csv($object) {
    my $output = [];
    for my $i ( 0 .. -1 + scalar $object->@* ) {
        for my $j ( 0 .. -1 + scalar $object->[$i]->@* ) {
            $output->[$j][$i] = $object->[$i][$j];
        }
    }
    return $output;
}

#sub write_csv ( $file, $csv ) {
#    csv( in => $csv, out => $file );
##}
