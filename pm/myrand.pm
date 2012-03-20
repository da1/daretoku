package myrand;
require Exporter;
use strict;
use warnings;

our @ISA = qw(Exporter);
our @EXPORT = qw(is_rand);
our @EXPORT_OK;
our $VERSION = 1.00;

sub is_rand {
    my $rate = 0.5;
    $rate = shift if @_;
    my $value = rand 1;
    return ($value < $rate);
}
1;
