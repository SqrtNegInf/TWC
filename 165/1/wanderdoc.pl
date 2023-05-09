#!/usr/bin/env perl
use v5.36;

#use warnings FATAL => qw(all);

use lib '.';
use my_svg;

my (@points, @lines);

my $input_file = 'example1.txt';

{
     open my $in, "<", "./$input_file" or die "$!";

     while ( my $line = <$in> )
     {
          chomp $line;
          $line =~ tr/ //ds;
          next unless length($line);

          my @arr = split(/,/, $line);
          my %h;



          if ( 2 == @arr )
          {
               @h{qw(x y)} = @arr; 
               push @points, \%h ;
          }
          elsif ( 4 == @arr )
          {
               @h{qw(x1 y1 x2 y2)} = @arr; 

               push @lines, \%h;
          }

          if ( 2 != @arr and 4 != @arr )
          {
               warn "Confusing line: <<$line>> ... ignoring ... $/";
          }
     }

}

my $output_svg = create_svg(\@points, \@lines);

#open my $out, ">", "/output_task1.svg" or die "$!";

print $output_svg;
