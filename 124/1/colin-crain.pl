#!/usr/bin/env perl
use v5.36;
use utf8;

binmode STDOUT, ':utf8';

use POSIX qw( round );

### ### ### cfg 

use constant { SPACE  => ' ' };
use constant { CHAR   => '⚐︎︎' };
use constant { WOMAN  => '♀︎' };
use constant { DUST   => '.' };

## all of these are pretty much voodoo, set to what looks good
use constant { CANVAS_MULTIPLIER   => 1.2 };  ## extra whitespace to canvas
use constant { FONT_WEIGHT         => 3.5 };  ## line width ratio to radius
use constant { CROSS_HEIGHT        => 1.2 };  ## ratio to radius
use constant { BAR_PLACEMENT       => 1.5 };  ## half way down vertical bar
use constant { NOISE_FACTOR        => 2.2 };  ## ??? larger is more
use constant { NOISE_SCALE_FACTOR  => 2 };    ## ??? scales the scaling 
use constant { DUST_SCALE          => 1.4 };  ## larger dust spread

### ### ### /cfg



### ### ### INPUT
my $size = shift @ARGV || 20;   ## default radius 20 chars



### init globals based on config

our $cen_rows = $size * CANVAS_MULTIPLIER;
our $cen_cols = $size * CANVAS_MULTIPLIER;
our $rad      = $size ;
our $width    = round( $size/FONT_WEIGHT );      ## round vs. truncation
our $buf      = [];

### ### ### main

draw_circle(    $cen_rows, $cen_cols, $rad-$_ ) for (0..$width-1);

draw_rectangle( $cen_rows + $rad, 
                $cen_cols - ($width/2),          ## centered at half canvas
                $rad * CROSS_HEIGHT, 
                $width );
                
draw_rectangle( $cen_rows + $rad * BAR_PLACEMENT, 
                $cen_cols - ($rad/2),            ## centered at half canvas
                $width, 
                $rad );

add_noisy_crowd(NOISE_FACTOR);

print_buffer();

### ### ### /main

sub draw_circle ( $cen_rows, $cen_cols, $rad ) {
## Bresenham's algorithm for a circle
    my $x = 0;
    my $y = $rad;
    my $d = 3 - 2 * $rad;
    
    draw_circle_to_buffer( $cen_rows, $cen_cols, $x, $y );
    
    while ( $y >= $x ) {
        $x++;
        if ($d > 0) {
            $y--;
            $d += 4 * ( $x - $y ) + 10;

        }
        else {
            $d += 4 * $x + 6;
        }
        draw_circle_to_buffer( $cen_rows, $cen_cols, $x, $y );
    }
}

sub draw_circle_to_buffer ( $cen_rows, $cen_cols, $x, $y ) {
    $buf->[$cen_rows+$x][$cen_cols+$y]
        = $buf->[$cen_rows-$x][$cen_cols+$y]
        = $buf->[$cen_rows+$x][$cen_cols-$y]
        = $buf->[$cen_rows-$x][$cen_cols-$y]
        = $buf->[$cen_rows+$y][$cen_cols+$x]
        = $buf->[$cen_rows-$y][$cen_cols+$x]
        = $buf->[$cen_rows+$y][$cen_cols-$x]
        = $buf->[$cen_rows-$y][$cen_cols-$x]
        = CHAR;
}

sub noise ($scale) {
## a tool to add noise to pixel placement - this is pretty much a magic
## function that is tuned to look right, whatever that means. Randomness
## falls off polynomially.
    srand 1;
    return int (rand($scale)**2 - $scale/2);
    $scale *= NOISE_SCALE_FACTOR;
    return int( (rand($scale) - $scale/2) ** 2 );
}


sub print_buffer {
    respace_buffer();
    say "$_->@*"  for $buf->@*;
}

sub respace_buffer {
## before printing (or adding noise, as it works out) we need to make sure
## the canvas is defined. Perhaps we should have gone with that precomputed
## and inititated canvas to start after all... Oh well. This works. Apply
## as necessary. This way give us more dynamic freedom with adding noise or
## whatnot. 
    for my $row ( 0..$buf->$#* ) {
        for my $col ( 0..$buf->[$row]->$#*)  {
            $buf->[$row][$col] = SPACE if not defined $buf->[$row][$col];
        }
    }
}

sub draw_rectangle ( $upper_left_row, $upper_left_col, $rows, $cols ) {
## upper left point, height and width 
    for my $row ( $upper_left_row..$upper_left_row + $rows ) {
        for my $col ($upper_left_col..$upper_left_col + $cols) {
            $buf->[$row][$col] = CHAR;
        }
    }  
}

sub add_noisy_crowd ($level){
## Pure artistic magic. Moves drawn chars with Brownian statistical
## roll-off and replaces the CHAR with a WOMAN, currently configured as a
## Unicode Venus symbol. Then creates much more random noise made up of
## dots, the "dust", based on the CHAR placement, but leaves any already
## defined elements alone, only adding new dots within a much larger random
## radius. The noise function at present also drifts slightly to the right
## and down; this is allowed by intent to dynamically draw the eye. It's
## just good composition. The dust is limited to the undefined spaces of
## the grid, the right and down, for the same reason. The artistic tuning
## of the `noise()` function, parameters and overwrite behavior is all a
## continual work-in-progress. I do like it as it is but it need not stay
## this way.

    respace_buffer();                     ## prevent dust from filling image
    for my $row ( 0..$buf->$#* ) {
        for my $col ( 0..$buf->[$row]->$#*)  {
            if ( defined $buf->[$row][$col] && $buf->[$row][$col] eq CHAR ) {
                my $x = $row + noise($level);
                my $y = $col + noise($level);
                $buf->[$x][$y] = WOMAN;   ## keep original char, but 
                                          ## overwrite venus symbols
                                          ## as it happens
                
                $x += noise($level+DUST_SCALE);
                $y += noise($level+DUST_SCALE);
                $buf->[$x][$y] //= DUST;  ## add dust to surrounding area
                                          ## but do not overwrite
                                          ## (only adds to undefined areas at 
                                          ## the right edge and below,
                                          ## giving a pleasing look)
            }
        }
    }
}
