#!/usr/bin/env perl
use v5.36;

my @names = <audino bagon baltoy banette bidoof braviary bronzor carracosta charmeleon cresselia croagunk darmanitan deino emboar emolga exeggcute gabite girafarig>;
my %hash;
my $max_length = 0;
my @chain;

#First, I need to group each name (in @names) by the starting letter
#so that I dont have to filter out @names in each iteration
#For this, I used Hashes of Arrays which will be structured like so:
#%hash = (
#    a => ["aduino"],
#    ...
#    e => ["emboar", "emolga", "exeggcute"],
#    ..
#    y => ["yamask"],
#)
for my $n (@names) {
    my $first = substr $n,0,1;
    push @{$hash{$first}}, $n;
}

#Iterate in each name in @names as start of sequence
for my $name (@names) {   
    my $last_char = substr $name,-1;
    #The first argumet is the starting name
    #The second argument is the name sequence in string format which would start as blank string. 
    # - I know there is probably a better approach but this is where I ended up with 
    #Last argument is an array from our Hashes of Array (%hash), this is to limit the iterations 
    #to names starting with the last letter of the first argument ($name) only instead of
    #going through @names and checking if it starts with <X> letter
    &iter($name, "", @{$hash{$last_char}} );
}

sub iter {
    my ($m_name, $m_name_arr , @m_name_list ) = @_;
    $m_name_arr .= "> $m_name ";

    for my $name (@m_name_list) {
        #check and skip if the $name is already in the name sequence in string format (stored in $m_name_arr, not really an 'ARR'ay lols)
        if (index($m_name_arr, $name) <0) {
            my $last_char = substr $name,-1;
            &iter($name, $m_name_arr, @{$hash{$last_char}} );
        } 
    }

    #Only do computation when name list is empty
    if (!@m_name_list) {
        #from what I understand the task was asking for the longest sequence,
        #I assumed that it refers to the highest number of names/chain in a valid sequence (not character count)
        my $length = $m_name_arr=~y/>//; 
        if ($length >= $max_length) {
            push @{$chain[$length]}, $m_name_arr;
            $max_length = $length;
        }
    }
    
}

#Print the longest sequence
#Print all when they are tied
say "Sequence:";
for my $seq (@{$chain[-1]}) {
    say "$seq\n";
}
say "Highest chain count: $#chain";
say "Number of Sequence found: ".@{$chain[-1]};

#my $run_time = time() - $start_run;
#say "Run Time: $run_time sec";
