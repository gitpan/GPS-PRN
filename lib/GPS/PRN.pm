package GPS::PRN;

=head1 NAME

GPS::PRN - Package for PRN - Object ID conversions.

=head1 SYNOPSIS

  use GPS::PRN;
  my $obj = GPS::PRN->new();
  print "PRN: ", $obj->prn_oid(22231), "\n";
  print "OID: ", $obj->oid_prn(1), "\n";

=head1 DESCRIPTION

=head3 Object Identification Number (OID)

The catalog number assigned to the object by the US Air Force. The numbers are assigned sequentially as objects are cataloged. This is the most common way to search for TLE data on this site.

Object numbers less then 10000 are always aligned to the right, and padded with zeros or spaces to the left.

=head3 Pseudo Randum Numbers (PRNs)

GPS satellites are identified by the receiver by means of PRN-numbers. Real GPS satellites are numbered from 1 – 32. WAAS/EGNOS satellites and other pseudolites higher numbers are assigned. These PRN-numbers of the satellites appear on the satellite view screens of many GPS receivers. For simplification of the satellite network 32 different PRN-numbers are available.


=head1 CONVENTIONS

Function naming convention is "format of the return" underscore "format of the parameters."

=cut

use strict;
use vars qw($VERSION);
$VERSION = sprintf("%d.%02d", q{Revision: 0.02} =~ /(\d+)\.(\d+)/);

=head1 CONSTRUCTOR

=head2 new

The new() constructor

  my $obj = GPS::PRN->new();

=cut

sub new {
  my $this = shift();
  my $class = ref($this) || $this;
  my $self = {};
  bless $self, $class;
  $self->initialize(@_);
  return $self;
}

=head1 METHODS

=cut

sub initialize {
  my $self = shift();
  my $param = shift();
}

=head2 prn_oid 

PRN given Object ID.

  my $prn=prn_oid(22231);

=cut

sub prn_oid {
  my $self=shift();
  my $param=int(shift());
  my $data=$self->data;
  return $data->{$param};
}

=head2 oid_prn

Object ID given PRN.

  my $oid=oid_prn(1);

=cut

sub oid_prn {
  my $self=shift();
  my $param=int(shift());
  my $data=$self->data;
  $data={map {int($data->{$_}), $_} keys %$data};
  return $data->{$param};
}

=head2 data

OID to PRN hash

=cut

sub data {
  my $self=shift();
  unless (defined($self->{'data'})) {
    $self->{'data'}={
                     22231 => q{01},
                     28474 => q{02},
                     23833 => q{03},
                     22877 => q{04},
                     22779 => q{05},
                     23027 => q{06},
                     22657 => q{07},
                     25030 => q{08},
                     22700 => q{09},
                     23953 => q{10},
                     25933 => q{11},
                     29601 => q{12},
                     24876 => q{13},
                     26605 => q{14},
                     20830 => q{15},
                     27663 => q{16},
                     28874 => q{17},
                     26690 => q{18},
                     28190 => q{19},
                     26360 => q{20},
                     27704 => q{21},
                     28129 => q{22},
                     28361 => q{23},
                     21552 => q{24},
                     21890 => q{25},
                     22014 => q{26},
                     22108 => q{27},
                     26407 => q{28},
                     22275 => q{29},
                     24320 => q{30},
                     29486 => q{31},
                     24819 => q{135} #or is this 122?
                    };
  }
  return $self->{'data'};
}

=head2 overload

Adds or overloads new OID/PRN pairs.

  $obj->overload($oid=>$prn);

=cut

sub overload {
  my $self=shift();
  my $oid=shift();
  my $prn=shift();
  my $data=$self->data;
  my $return=q{added};
  if (exists($data->{$oid})) {
    $return='overloaded';
  }
  $data->{$oid}=$prn;
  return defined($data->{$oid}) ? $return : undef();
}

=head2 reset

Resets OID/PRN pairs to package defaults.

  $obj->reset;

=cut

sub reset {
  my $self=shift();
  undef($self->{'data'});
}

1;

__END__

=head1 TODO

=head1 BUGS

Please send to the gpsd email list.

=head1 LIMITS

=head1 AUTHOR

Michael R. Davis qw/perl michaelrdavis com/

=head1 LICENSE

Copyright (c) 2006 Michael R. Davis (mrdvt92)

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO
