#!/usr/bin/env perl
use v5.36;

my @player_ages = (
    [20, "Alex"  ],
    [28, "Joe"   ],
    [38, "Mike"  ],
    [18, "Alex"  ],
    [25, "David" ],
    [18, "Simon" ],
);

my @player_names = (
    ["Alex", "Stewart"],
    ["Joe",  "Root"   ],
    ["Mike", "Gatting"],
    ["Joe",  "Blog"   ],
    ["Alex", "Jones"  ],
    ["Simon","Duane"  ],
);

hash_join(\@player_ages, 1, \@player_names, 0);

sub hash_join {
    my ($table_1, $key_1, $table_2, $key_2) = @_;

    my $names = {
        map {
            join(", ", @$_) => $_->[$key_2]
        } @$table_2
    };

    foreach my $player (@$table_1) {
        my $key = $player->[$key_1];
        my $age = $player->[0];
        foreach my $n (sort keys %$names) {
            if ($names->{$n} eq $key) {
                print "$age, $n\n";
            }
        }
    }
}
