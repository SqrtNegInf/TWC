#!/usr/bin/env perl
#use v5.36;
### 2023-05-09 could not get this working, between export/import, Moo
#

#
#       white-line-fever.pl
#
#       Line of Best Fit
#         Submitted by: Ryan J Thompson
#         When you have a scatter plot of points, a line of best fit is the
#         line that best describes the relationship between the points, and
#         is very useful in statistics. Otherwise known as linear
#         regression.
# 
#         The method most often used is known as the least squares method,
#         as it is straightforward and efficient, but you may use any
#         method that generates the correct result.
# 
#         Calculate the line of best fit for the following 48 points:
# 
#         333,129  39,189 140,156 292,134 393,52  160,166 362,122  13,193
#         341,104 320,113 109,177 203,152 343,100 225,110  23,186 282,102
#         284,98  205,133 297,114 292,126 339,112 327,79  253,136  61,169
#         128,176 346,72  316,103 124,162  65,181 159,137 212,116 337,86
#         215,136 153,137 390,104 100,180  76,188  77,181  69,195  92,186
#         275,96  250,147  34,174 213,134 186,129 189,154 361,82  363,89
#
#       © 2022 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



use warnings;
use strict;
use utf8;
use feature ":5.26";
use feature qw(signatures);
no warnings 'experimental::signatures';

## SVG package
package SVG;
use Moo;
use feature qw(signatures);
no warnings 'experimental::signatures';
{
    has groups        => ( 
        is      => 'rw' ,
        default => sub { return [] } );
    has height        => ( is      => 'rw' );
    has width         => ( is      => 'rw' );

    around BUILDARGS => sub {
        my ( $orig, $class, @args ) = @_;
        return {    height => $args[0],
                    width  => $args[1]  };        
    };

    sub group( $self, $id, $attr ) {
        push $self->groups->@*, [$id, $attr, []]
    }

    sub add( $self, $item ){
        push $self->groups->[-1]->[2]->@*, $item;
    }

    ## supported object primitives 
    
    sub circle( $self, $x, $y, $r=3) {
    ## default radius 3 for single point
        return qq(<circle cx="${x}" cy="${y}" r="${r}" />);
    }

    sub line( $self, $x1, $y1, $x2, $y2 ) {
        return qq(<line x1="${x1}" x2="${x2}" y1="${y1}" y2="${y2}" />);
    }

    ## output
    
    sub make_SVG( $self ) {
        my $h   = $self->height;
        my $w   = $self->width;

        my $xml = <<~XML;
            <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
            <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.0//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
            <svg height="${h}" width="${w}" 
                xmlns="http://www.w3.org/2000/svg" 
                xmlns:svg="http://www.w3.org/2000/svg" 
                xmlns:xlink="http://www.w3.org/1999/xlink">
            XML
        for my $g ( $self->groups->@* ){
            my $tag = qq(<g id="$g->[0]"  );
            $tag   .= qq($_="$g->[1]->{$_}" ).' ' for keys $g->[1]->%*;
            $tag   .= qq(>\n);
            $tag   .= qq(    $_\n) for $g->[2]->@*;
            $tag   .= qq(</g>\n);
        
            $xml .= $tag;
        }
        $xml .= qq(</svg>\n);
        return $xml;
    }
}

##/SVG

package main;

## input data
my @data = (
        [333,129], [39,189], [140,156], [292,134], [393,52], 
        [160,166], [362,122], [13,193], [341,104], [320,113], 
        [109,177], [203,152], [343,100], [225,110], [23,186], 
        [282,102], [284,98], [205,133], [297,114], [292,126], 
        [339,112], [327,79], [253,136], [61,169], [128,176], 
        [346,72], [316,103], [124,162], [65,181], [159,137], 
        [212,116], [337,86], [215,136], [153,137], [390,104], 
        [100,180], [76,188], [77,181], [69,195], [92,186], 
        [275,96], [250,147], [34,174], [213,134], [186,129], 
        [189,154], [361,82], [363,89] );

## make SVG format data string 
my $attr;    
my $svg = new SVG(400,400);

$attr = { "fill"=>"blue" };
$svg->group( "points", $attr);
$svg->add( $svg->circle($_->@*) ) for @data;

$attr  = { "stroke" => "red",  "stroke-width" => "4" };
#$svg->group( "best-fit-line", $attr );
$svg->add( $svg->line( best_fit(@data) ) );

## write to file, ./best-fit.svg
#open my $fh, ">", "best-fit.svg" or die "cant open bestfit.svg to output: $!\n";
my $xml = $svg->make_SVG;
say $xml;
#close $fh;


sub best_fit (@points) {
    my ($xsum, $ysum, $sqsum, $xysum);

    for (@data) {
        $xsum  += $_->[0];
        $ysum  += $_->[1];
        $sqsum += $_->[0] ** 2;
        $xysum += $_->[0] * $_->[1];
    }

    my $slope     = ((@data * $xysum) - ($xsum * $ysum)) / ((@data * $sqsum) - ($xsum ** 2));
    my $intercept = ($ysum - ($slope * $xsum)) / @data;
    
    ## hardwired 400px canvas for now
    my $xmax = 400;
    
    ## x1, y1, x2, y2
    return (0, $intercept, 400, ($slope * 400 + $intercept))
}
