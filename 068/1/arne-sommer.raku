#!/usr/bin/env raku

# try to silence warnings...

use Math::Matrix;

unit sub MAIN (Str $original = "1 0 1 | 1 1 1 | 1 1 1", :$v, :$verbose = $v); 

my $str = $original.subst("\\n", "\n", :g)
                   .subst("|",   "\n", :g)                   
                   .trans("," => ' ')
                   .subst(/ \] \s* \[ /,  "\n", :g)
                   .trans("[]" => '');

die "Illegal field value $str (only '0' and '1')" unless all($str.words) eq any("0"|"1");

quietly my $old = Math::Matrix.new($str);

my $new = $old.clone;

my ($rows, $columns) = $old.size;

for ^$rows -> $row
{
  for ^$columns -> $column
  {
    if $old.element($row, $column) == 0
    {
      say ": Found 0 at [row:$row, col:$column]" if $verbose;
      quietly $new.=multiply(row    => $row,    0);
      quietly $new.=multiply(column => $column, 0);
    }
  }
}

say "[{ @($_).join(", ") }]" for $new.list-rows;
