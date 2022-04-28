#!/usr/bin/env raku

$_ = 'bookkeeper';

/                 # Start a Perl 6 regex (called "regular  expression" in Perl  5).
    (                 # Start a group  to match a string  of  identical  characters.
        (.)           # Match a single  character.
        {}            # "This  code  block  publishes  the  capture  inside  the
                      # regex , so that it can be  assigned  to other  variables
                      # or used  for  subsequent  matches ."
        $0*           # Match  the  previously  matched  character
                      # zero or more  times.
    )*            # End  the  group  to match a string  of  identical  characters.
                  # There  are  zero or more  groups  of  identical  characters.
/;                # End  the  Perl 6 regex.

# "Coercing  the  match  object  to a list  gives  an easy  way
# to  programmatically  access  all  elements :"
say $/.list.join;
