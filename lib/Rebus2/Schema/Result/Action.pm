use utf8;
package Rebus2::Schema::Result::Action;

=head1 NAME

Rebus2::Schema::Result::Action

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<action>

=cut

__PACKAGE__->table("actions");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 action

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "action",
  { data_type => "varchar", is_nullable => 0, size => 64 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 action_logs

Type: has_many

Related object: L<Rebus2::Schema::Result::ActionLog>

=cut

__PACKAGE__->has_many(
  "action_logs",
  "Rebus2::Schema::Result::ActionLog",
  { "foreign.action" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;