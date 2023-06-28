#!/usr/bin/env perl
use v5.36;

use Test::More;

sub caesar
{
     my ($str, $num) = @_;

     my @alphabet = 'A' .. 'Z';

     my %encrypt;
     $encrypt{q( )} = q( );
     @encrypt{@alphabet} = @alphabet[   $#alphabet - $num + 1 .. $#alphabet, 
                                        0 .. $#alphabet - $num];
     $str =    join '',
               map $encrypt{$_},
               split(//,$str);

     return $str;
}




is(caesar(qq(THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG), 3),
          qq(QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD), 'Example');
done_testing();
