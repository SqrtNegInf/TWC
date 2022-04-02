#!/usr/bin/env raku



unit sub MAIN (Str $str = 'xyzzyxwvuvu');

## because of dynamic conditions, we need to 
## recheck uniqueness as individual chars are added 
## we will use a hash to keep track of char counts
my %unique;
my $fnr;
my @prev;
my $output;

## 1. divide str
## 2. apply function over characters to determine fnr
## 3. write either fnr or '#' to output if Nil
## 4. join back into single string
$output = $str.comb
              .map({ %unique{$_}++;  
                     $fnr = do {
                          when %unique{$_} == 1 {
                              @prev.push($fnr) if $fnr.defined;
                              $_;                       
                          }
                          when $_ === $fnr {
                              ## recheck for uniqueness
                              @prev .= grep({ %unique{$_} == 1 });
                              @prev.pop // Nil;
                          }
                          $fnr;  
                     }
                     (defined $fnr) ?? $fnr !! '#';              
                })
              .join('');

$str   .say;
$output.say;


