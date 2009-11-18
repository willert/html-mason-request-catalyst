package MasonX::TraitFor::Request::Catalyst::Context;

use Moose::Role;
use namespace::autoclean;

# requires 'some_method';

=head1 NAME

MasonX::TraitFor::Request::Catalyst::Context - Catalyst context for Mason

=head1 DESCRIPTION

B<MasonX::TraitFor::Request::Catalyst::Context> is a L<Moose::Role>
that provides a standard interface to access the catalyst context
from within mason requests.

=attr ctx

The Catalyst context object associated with the current request

=cut

has catalyst_ctx => (
  is       => 'ro',
  isa      => 'Catalyst',
  required => 1,
  weak_ref => 1,
);

no Moose::Role;

1;

__END__

=head1 SEE ALSO

L<perl>, L<Moose::Role>

=head1 AUTHOR

Sebastian Willert, C<willert@gmail.com>

=head1 COPYRIGHT

This program soley owned by its author. Redistribution is prohibited.

=cut

