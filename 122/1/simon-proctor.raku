#!/usr/bin/env raku

sub avg($avg,$val) {
    state $count = 1;
    my $sum = $avg*$count;
    $sum += $val;
    $count++;
    $sum / $count;
}

#| Given a list of numbers print the average of the list with each point in the list
my @N = <10 20 30 40 50 60 70 80 90 100>;
    ( [\[&avg]] @N ).join(", ").say;

#| Read from STDIN and output the running average after each number
#multi sub MAIN() {
#    .say for [\[&avg]] $*IN.lines;
#}
