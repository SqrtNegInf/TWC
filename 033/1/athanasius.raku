#!/usr/bin/env raku

################################################################################
=begin comment

Perl Weekly Challenge 033
=========================

Task #1
-------
*Count Letters (A..Z)*

Create a script that accepts one or more files specified on the command-line and
count the number of times letters appeared in the files.

So with the following input file sample.txt

  The quick brown fox jumps over the lazy dog.

the script would display something like:

=end comment
################################################################################

#===============================================================================
sub MAIN
(
    Bool:D :$count = False,         #= Order by letter counts (highest first)
    Bool:D :$help  = False         #= Print usage details and exit
)
#===============================================================================
{
        my %counts;
        my  @filenames = <../00-blogs>;
        for @filenames -> Str $filename
        {
            for $filename.IO.lines -> Str $line
            {
                ++%counts{ $_ } for $line.lc.split('').grep({ rx/ <[a..z]> / });
                #++%counts{ .lc } for $line.split('').grep({ rx:i/ <[a..z]> / }); # JVM misses upper-case
            }
        }

        my &sort-by = $count ?? sub { %counts{ $^b } <=> %counts{ $^a } ||
                                       $^a cmp $^b }
                             !! sub {  $^a cmp $^b };

        "%s: %d\n".printf: $_, %counts{ $_ } for %counts.keys.sort: &sort-by;
}

################################################################################
