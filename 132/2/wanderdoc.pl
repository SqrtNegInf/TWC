#!/usr/bin/env perl
use v5.36;

my @player_ages = ( [20, "Alex"  ], [28, "Joe"   ], [38, "Mike"  ],
                    [18, "Alex"  ], [25, "David" ], [18, "Simon" ], );

my @player_names = ( ["Alex", "Stewart"], ["Joe",  "Root"], ["Mike", "Gatting"],
                     ["Joe",  "Blog"   ], ["Alex", "Jones"],["Simon","Duane"  ],);


sub hash_join
{
     my ( $tbl_1, $idx_1, $tbl_2, $idx_2 ) = @_;
     my %seen;
     my @groups = grep { not $seen{$_}++ } map { $_->[$idx_1] }  @{$tbl_1};
     
     my @output;


     for my $name ( @groups )
     {
          my @slice = grep { $_->[$idx_1] eq $name } @{$tbl_1};

          for my $probe ( grep { $_->[$idx_2] eq $name } @{$tbl_2} )
          {
               for my $item ( @slice )
               {

                    push @output, [@$item, $probe->[1]];
               }
          }
     }

     return @output;
}



my @result = hash_join(\@player_ages, 1, \@player_names, 0);
print join(',', @$_), $/ for @result;
