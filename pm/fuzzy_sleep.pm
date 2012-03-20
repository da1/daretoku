package fuzzy_sleep;
require Exporter;
use strict;
use warnings;
use Time::HiRes qw(sleep);

our @ISA = qw(Exporter);
our @EXPORT = qw(fzsleep);
our @EXPORT_OK;
our $VERSION = 1.00;

sub fzsleep {
    my $band = shift;
    return sub {
        my $count = shift;
        my $value = $count + (rand($band*2) - $band);
        $value = 0 if $value < 0;
        #print "fzsleep: $value\n";
        sleep $value;
    }
}
1;
