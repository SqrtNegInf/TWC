#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);

sub treeToList :prototype(\@\@);

# Unbuffered STDOUT
$|++;

my %tree = ( 
  'Tree 1 (balanced)' => 
    [1, 
      [2, 
        [3, []],
        [4, []] 
      ],
      [5,
        [6, []],
        [7, []]
      ]
    ],
  'Tree 2 (empty left node)' => 
    [3,
      [2, []],
      [4,
        [1, 
          [9, []],
          [],
        ],
        []
      ]
    ],
  'Tree 3 (straight to right)' =>
    [3,
      [],
      [5,
        [1,
          [9, []],
          [],
        ],
        []
      ]
    ],
);

foreach my $case (sort keys %tree) {
  my (@nodes);

  treeToList(@nodes, @{$tree{$case}});

  printf "===============================\n";
  printf "Tree: '%s'\n", $case;
  #p $tree{$case};
  printf "List: (%s)\n", join(' -> ', @nodes);
  printf "===============================\n\n";
}

sub treeToList :prototype(\@\@) {
  my ($arN, $ar) = @_;

  foreach my $a (@$ar) {
    if (ref($a) eq '') {
      push(@$arN, $a);
    } elsif (ref($a) eq 'ARRAY' and
             scalar(@$a) > 0) {
      treeToList(@$arN, @$a);
    }
  }
}
