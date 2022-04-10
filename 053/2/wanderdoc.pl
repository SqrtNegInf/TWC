#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Algorithm::Combinatorics qw(variations);
use Getopt::Std;

my @vowels = qw(a e i o u);

my @pos_patterns = ( qr/a[ei]/ , qr/ei/ , qr/i[aeou]/,
                 qr/o[au]/, qr/u[oe]/ );
my @neg_patterns = ( qr/a(?=[aou])/ , qr/e(?=[aeou])/ , qr/i(?=i)/,
                 qr/o(?=[eio])/, qr/u(?=[aiu])/ );
my $iter = variations(\@vowels, 3);

my %already_found;

VAR: while ( my $c = $iter->next )
{


     my $str = join('',@$c);

     for my $pp ( @pos_patterns )
     {
          if ( $str =~ /$pp/ )
          {
               for my $np ( @neg_patterns )
               {
                    next VAR if $str =~ /$np/;
               }
               # A string with length > 2 can match > 1 patterns.
               $already_found{$str}++; 
               print $str, $/ if 1 == $already_found{$str};
          }
     }
}
