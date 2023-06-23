#!/usr/bin/env perl
use v5.36;

use File::Slurp;

die "Usage: ch-2.pl [DATAFILE]\n" if @ARGV > 1;
my $datafilename = shift // $0;


#
# my $maxlen = maxlength( @data );
#       Find and return the maximum length of any string
#       element of @data.
#
sub maxlength( @data )
{
        my $maxlen = 0;
        foreach my $s (@data)
        {
                my $l = length($s);
                $maxlen = $l if $l>$maxlen;
        }
        return $maxlen;
}


#
# my @centred = center( @data );
#       Center every element of @data, building
#       and returning a new @centred array, in
#       which every element is the original element
#       of @data, padded with leading spaces to centere it.
#
sub center( @data )
{
        my @result;
        my $maxlen = maxlength( @data );
        foreach my $s (@data)
        {
                my $l = length($s);
                my $pad = ($maxlen - $l)/2;
                my $centred = (' 'x$pad).$s;
                push @result, $centred;
        }
        return @result;
}


my @data = read_file( $datafilename );
my @centered = center( @data );
map { print } @centered;
