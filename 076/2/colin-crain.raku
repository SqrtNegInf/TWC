#!/usr/bin/env raku


unit sub MAIN (Str $file = 'grid.txt', Str $dict = 'words.txt') ;

## cfg
my $MINWORD = 5;        ## val > 1 

## in 
my @matrix = $file.IO.lines 
                  .map( { .comb(/\w/).cache; } ); ## <-- need to cache the internal Seqs
my %lookup = $dict.IO.lines
                  .map( { my $copy = $_; $copy.=uc; $copy => 1} );

## work   
my @possibles;
for 0..@matrix.end -> $y {          ## height
    for 0..@matrix.head.end -> $x {   ## width
        @possibles.append: |word_vectors( $x, $y, @matrix);
    }
}
my @output = @possibles.grep:{ %lookup{$_}:exists }                 

## out
.put for @matrix;
say '';
say "found ", @output.elems, " words of minimum length $MINWORD: \n";
.say for sort @output;
     
# + + + + + + + + + + + + + + + + + + + + + +    

sub word_vectors ($x, $y, @mat)  {
    my $height = @mat.end;
    my $width  = @mat.head.end;
    my @words;
    my @vectors ;
    my $i = $x;
    
    ## formulae for the 8 vectors
    @vectors.push( $_() ) for 
        { ($x..$width).map:    { @mat[$y][$_]} },                          ## horz forward
        { (0..$x).reverse.map: { @mat[$y][$_]} },                          ## horz back
        { ($y..$height).map:   { @mat[$_][$x]} },                          ## vert down
        { (0..$y).reverse.map: { @mat[$_][$x]} },                          ## vert up
        { ($y..$height).map:   { last if $i > $width; @mat[$_][$i++] } },  ## diag down forward
        { ($y..$height).map:   { last if $i < 0;      @mat[$_][$i--] } },  ## diag down back
        { (0..$y).reverse.map: { last if $i > $width; @mat[$_][$i++] } },  ## diag up forward
        { (0..$y).reverse.map: { last if $i < 0;      @mat[$_][$i--] } } ; ## diag up back  
    
    ## turn vectors into strings $MINWORD letters or longer
    for @vectors -> @v {
        $i = $x;       ## <-- lazy evaluation in map Seqs above need the reset to be here!
        next if @v.elems < $MINWORD;
        my $stem      = ( @v[0..$MINWORD-2] ).join;
        my @vec_words = ( @v[$MINWORD-1..@v.end] ).map: { $stem ~= $_ } ;
        @words.push: |@vec_words;
    }
    return @words;
}                  
