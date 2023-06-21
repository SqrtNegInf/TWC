#!/usr/bin/env perl
use v5.36;

my %us_states = (
    AL => 'Alabama',
    AK => 'Alaska',
    AZ => 'Arizona',
    AR => 'Arkansas',
    CA => 'California',
    CO => 'Colorado',
    CT => 'Connecticut',
    DE => 'Delaware',
    FL => 'Florida',
    GA => 'Georgia',
    HI => 'Hawaii',
    ID => 'Idaho',
    IL => 'Illinois',
    IN => 'Indiana',
    IA => 'Iowa',
    KS => 'Kansas',
    KY => 'Kentucky',
    LA => 'Louisiana',
    ME => 'Maine',
    MD => 'Maryland',
    MA => 'Massachusetts',
    MI => 'Michigan',
    MN => 'Minnesota',
    MS => 'Mississippi',
    MO => 'Missouri',
    MT => 'Montana',
    NE => 'Nebraska',
    NV => 'Nevada',
    NH => 'New Hampshire',
    NJ => 'New Jersey',
    NM => 'New Mexico',
    NY => 'New York',
    NC => 'North Carolina',
    ND => 'North Dakota',
    OH => 'Ohio',
    OK => 'Oklahoma',
    OR => 'Oregon',
    PA => 'Pennsylvania',
    RI => 'Rhode Island',
    SC => 'South Carolina',
    SD => 'South Dakota',
    TN => 'Tennessee',
    TX => 'Texas',
    UT => 'Utah',
    VT => 'Vermont',
    VA => 'Virginia',
    WA => 'Washington',
    WV => 'West Virginia',
    WI => 'Wisconsin',
    WY => 'Wyoming',
);

my @codes = keys %us_states;            # all states two letter codes
my $codes = join("|", @codes);          # regex to match any codes
my $regex = qr/^($codes)+$/i;           # regex to match word composed of codes

# find all words that match, save longest ones
my @longest;
open(my $fh, "<", '/usr/share/dict/words') or die "open words.txt: $!\n";
while (<$fh>) {
    chomp;
    next unless /$regex/;               # filter words that match state codes
    if (!@longest || length($_) > length($longest[0])) {
        @longest = ($_);
    }
    elsif (length($_) == length($longest[0])) {
        push @longest, $_;
    }
}

# show longest words in form: word = state + state + ...
for my $word (@longest) {
    my @states = map {$_ = $us_states{uc($_)}} grep {$_} split /(..)/, $word;
    say $word, " = ", join(" + ", @states);
}
