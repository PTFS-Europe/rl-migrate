use utf8;

package Rebus::Schema::Result::ActionLog;

=head1 NAME

Rebus::Schema::Result::ActionLog

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

=head1 TABLE: C<action_log>

=cut

__PACKAGE__->table("action_logs");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 action_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 object

  data_type: 'text'
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  is_nullable: 0

=head2 time

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {data_type => "integer", is_auto_increment => 1, is_nullable => 0,},
  "action_id",
  {data_type => "integer", is_foreign_key => 1, is_nullable => 0,},
  "object",
  {data_type => "text", is_nullable => 0},
  "user_id",
  {data_type => "integer", is_nullable => 0},
  "time",
  {data_type => "timestamp", datetime_undef_if_invalid => 1, default_value => \"current_timestamp", is_nullable => 0,},
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 action

Type: belongs_to

Related object: L<Rebus::Schema::Result::Action>

=cut

__PACKAGE__->belongs_to(
  "action",
  "Rebus::Schema::Result::Action",
  {id            => "action_id"},
  {is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT"},
);

=head2 user

Type: belongs_to

Related object: L<Rebus::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user", "Rebus::Schema::Result::User",
  {id            => "user_id"},
  {is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT"},
);

1;
