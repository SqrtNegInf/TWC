#!/usr/bin/env raku

constant COL_WIDTH = 4;

# (),(1,),(1,2),(1,2,3),(1,2,3,4),(1,2,3,4,5),(1,2,3,4,5,6);

my @n = (1,5,4,3,2,6,7);
my @summation = create-summation-arrays( @n );
my $result = final-summation( @summation );

say 'Input: @n = ' ~ "( " ~ @n.List().join(', ')
        ~ ")\nOutput: " ~ $result ~  "\n";
display-summation( @summation );

sub display-summation( @ary --> Nil ) {
    my $ct =0;
    my $fld-width = COL_WIDTH;
    for @ary -> @a {
        print ' ' x ($ct * $fld-width);
        for @a -> $fld {
            printf "%$($fld-width)s", $fld;
        }
        ++ $ct;
        print "\n";
    }
}

sub create-summation-arrays( @ary-pos-int --> Array ) {
    my @current = @ary-pos-int;
    (my @return).push: @ary-pos-int ;

    while @current.end > 0 {
        my @tmp;
        for 1 .. @current.end -> $i {
            @tmp.push:  [+] @current[1 ... $i];
        }
        @return.push: @tmp;
        @current = @tmp;
    }
    @return;
}

sub final-summation( @AoSummation ) { return @AoSummation[*-1][0]; }

