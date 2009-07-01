package Template::Plugin::WikiCreole;
use strict;
use warnings;

use base 'Template::Plugin::Filter';
use Text::WikiCreole;

our $VERSION = '0.01';

=head1 NAME

Template::Plugin::WikiCreole - TT wrapper for L<Text::WikiCreole>

=head1 SYNOPSIS

  [% USE WikiCreole %]
  [% FILTER $WikiCreole %]
  ...
  [% END %]

=head1 DESCRIPTION

This is a plugin used for Wiki Creole rendering inside Template Toolkit.

  [% USE WikiCreole %]

At this time none of the method for customising L<Text::WikiCreole> are
directly available. However Text:WikiCreole is an exporter and its methods act
globaly.  So you can use this class in your software and call its methods to
change the behavour in the template.

This source itself is a blatant copy of L<Template::Plugin::WikiFormat> by
Ivor Williams



=head1 METHODS

=head2 filter

Accepts the wiki text to be rendered, and context.  See
L<Template::Plugin::Filter>.

=cut

sub filter {
    my ( $self, $text ) = @_;

    my $conf = $self->{_CONFIG};
    $conf ||= {};
    my %tags = %$conf;
    my %opts;
    my %default = ( # Consider and ther how best to do them
    );
    for ( keys %default ) {
        $opts{$_} = $tags{$_} || $default{$_};
        delete $tags{$_};
    }

    my $output = creole_parse( $text, \%tags );

    return $output;
}

=head1 BUGS

Please use http://rt.cpan.org for reporting any bugs.

=head1 TODO

Create arguments to pass 

=head1 AUTHOR

 Martin Ellis

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.


=head1 SEE ALSO

L<Text::WikiCreole>
L<Template::Plugin::WikiFormat>
L<Template::Plugin::Filter>

=cut

#################### main pod documentation end ###################

1;

# The preceding line will help the module return a true value

