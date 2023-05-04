#!/usr/bin/env perl
use v5.36;
use DateTime;

my $date1 = "2019-09-15";
my $date2 = "2021-09-16";    # Output:  2 years  1day -> and 2day

getDuration($date1, $date2);
 
 sub createDateObj
{
    my ($year, $month, $day) = @_;
    
    my $dateObj = DateTime->new(
        year        => $year,
        month       => $month,
        day         => $day,
        hour        => 0,
        minute      => 0,
        second      => 0,
        nanosecond  => 0,
    );

    return $dateObj;
}

sub isLeapYear
{
    my $year = shift;
    my $returnval = 0;
    
    if( ($year % 4) == 0)
    {
        # it is not a leapyear if it can be divied by 100
        if( ($year % 100) == 0)
        {
            #but is a leapyear if it can be divided by 400
            if( ($year % 400) == 0)
            {
                $returnval = 1;
            }
        }
        
        #it is leapyear
        else
        {
            $returnval = 1;
        }
    }
    
    return $returnval;
    
}
sub getDuration
{
    my($start, $end) = @_;
    
    my ($startYear, $startMonth, $startDay) =  ($start =~ m/^   (\d{1,4})  -  (\d{1,2}) -  (\d{1,2})  $/x  );
    my ($endYear, $endMonth, $endDay)       =  ($end =~ m/^   (\d{1,4})  -  (\d{1,2}) -  (\d{1,2})  $/x  );
    
    if( (not defined $startYear) || (not defined $startMonth) || (not defined $startDay)   ||
        (not defined $endYear)   || (not defined $endMonth)   || (not defined $endDay))
    {
        die("Please give valid date in yyyy-mm-dd format!!");
    }
    
    #check if the end date is greater than the start date
    if( $startYear > $endYear )
    {
        die "Start year is greater than previous year";
    }
    else
    {
        if( ($startYear == $endYear) && ($startMonth > $endMonth))
        {
            die "Start month is greater than previous month. Died";
        }
        else
        {
            if( ($startDay == $endDay) &&  ($startDay > $endDay))
            {
                die "Start day is greater than previous day. Died";
            }
            else
            {
                # date is valid yay!
            }
        }
    }
    
    my $startDate = createDateObj($startYear, $startMonth, $startDay);
    my $endDate   = createDateObj($endYear, $endMonth, $endDay);
    
    
    my $duration = $endDate->delta_days($startDate);
    
    my $days = $duration->{days};
    
    say qq(Start $startYear \t $startMonth \t $startDay);
    say qq(Start $endYear   \t $endMonth   \t $endDay);
    say qq(Number of days between the two dates: $days);
    
    my $durationInYears = int($endYear) - int($startYear);
    my $returnYear;
    my $leapDays = 0;
    
    my $resultYears;
    my $resultDays;

    #if it is shorter than 1 year do not bothe with leapyear check
    if($durationInYears < 1 )
    {
        $returnYear = 0;
        $resultDays = $days;

    }

    # leapyear checks
    else
    {
        for(int($startYear)..int($endYear))
        {
            $leapDays += isLeapYear($_);
        }
        
        # to eliminate the possibility of adding leapdays if the starting day is after 02 28
        if( isLeapYear(int($startYear)) )
        {
            #if it is not february or january
            if( (int($startMonth)>2) )
            {
                $leapDays--;
            }
            
            # it is january or february
            else
            {
                if( (int($startMonth) == 2) && (int($startDay) == 29))
                {
                   $leapDays--;
                }
            }
        }
        
        # to eliminate the possibility of adding leapdays if the ending day is before 02.28
        if( isLeapYear(int($endYear)) )
        {
            #if it is not february or january
            if( (int($endMonth)>2) )
            {
                $leapDays--;
                #do nothing
            }
            
            # the duration ends after 02.29 a leapday is present
            else
            {
                
            }
        } 
        
        say qq(Number of leapdays in the duration $leapDays);
        my $daysWithoutLeapDays = $days - $leapDays;
           
        $resultYears = int($daysWithoutLeapDays / 365);

        $resultDays  = ($days - $resultYears*365);        
        
    }
    
    
    # plural for for words
    my $yearPlural= "";
    if($resultYears > 1)
    {
        $yearPlural ="s";
    }
    
    my $dayPlural= "";
    if($resultDays > 1)
    {
        $dayPlural ="s";
    }

    
    if(not defined $resultYears)
    {
        say qq($resultDays day$dayPlural );
    }
    elsif( $resultDays == 0)
    {
        say qq($resultYears year$yearPlural);
    }
    
    else
    {
        
        say qq($resultYears year$yearPlural and $resultDays day$dayPlural );
    }


} #END OF -  sub getDuration
