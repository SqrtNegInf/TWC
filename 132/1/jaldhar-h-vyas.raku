#!/usr/bin/env raku

sub MAIN() {
    my $birthday = Date.new('1971-03-22');
    my $today = '2022-09-22'.Date;
    my $diff = $today - $birthday;

    my $past = $birthday - $diff;
    my $future = $today + $diff;
    say $past.yyyy-mm-dd(q{/}), q{, }, $future.yyyy-mm-dd(q{/});
}
