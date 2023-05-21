#!/usr/bin/env perl
use v5.36;

use Data::Dump 'dump';

my @player_ages = (
    [20, "Alex"  ],
    [28, "Joe"   ],
    [38, "Mike"  ],
    [18, "Alex"  ],
    [25, "David" ],
    [18, "Simon" ],
);
my $player_ages_key = 1;

my @player_names = (
    ["Alex", "Stewart"],
    ["Joe",  "Root"   ],
    ["Mike", "Gatting"],
    ["Joe",  "Blog"   ],
    ["Alex", "Jones"  ],
    ["Simon","Duane"  ],
);
my $player_names_key = 0;

my @result = hash_join(\@player_ages, $player_ages_key,
                       \@player_names, $player_names_key);
for (@result) {
    say join(", ", map {dump($_)} @$_);
}

sub hash_join {
    my($table1, $key1, $table2, $key2) = @_;
    my %build;
    for my $row (@$table1) {
        my $key = $row->[$key1];
        $build{$key} ||= [];
        push @{$build{$key}}, $row;
    }
    my @result;
    for my $row_probe (@$table2) {
        my $key = $row_probe->[$key2];
        for my $row_build (@{$build{$key}}) {
            my @row = (@$row_build,
                       @{$row_probe}[0..$key2-1, $key2+1..$#$row_probe]);
            push @result, \@row;
        }
    }
    return @result;
}
