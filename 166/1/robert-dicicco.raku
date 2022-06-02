#!/usr/bin/env raku

my %letters = 'a'=>'a','b'=>'b','c'=>'c','d'=>'d','e'=>'e','f'=>'f','o'=>'0','l'=>'1','i'=>'1','s'=>'5','t'=>'7';
my $found = 0;
my $selection = 0;

sub MAIN( UInt $selection = 4) {

  MY_LOOP:
  for 'words.txt'.IO.lines  {
    my $line_lc = $_;
    $line_lc = $line_lc.trim.lc;
    next MY_LOOP if $line_lc.chars != $selection;

    my @arr = $line_lc.comb;

    for ( @arr ) -> $letter {
      if %letters{$letter}  { $found++; }
    }

    if $found == $selection {
      $line_lc ~~ tr/olist/01157/;
      print "$line_lc ";
    }

    $found = 0;
  }

}
