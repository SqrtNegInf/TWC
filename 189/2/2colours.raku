#!/usr/bin/env raku


  my @array = (2, 1, 2, 1, 1);
  my %positions = @array.antipairs.classify(*.key, as => *.value);
  my $array-degree = %positions.map(*.value.elems).max; 
  my @common-value-ranges <==
    %positions
    .grep: *.value == $array-degree andthen
    .map: *.value.minmax;
  my $slice-size = @common-value-ranges>>.elems.min;
  my @solution-ranges = @common-value-ranges.grep(* == $slice-size);
  @array[@solution-ranges>>.Slip].map(*.raku).join(' or ').say;
