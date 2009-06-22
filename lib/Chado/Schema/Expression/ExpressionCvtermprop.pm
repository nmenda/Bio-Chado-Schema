package Chado::Schema::Expression::ExpressionCvtermprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("expression_cvtermprop");
__PACKAGE__->add_columns(
  "expression_cvtermprop_id",
  {
    data_type => "integer",
    default_value => "nextval('expression_cvtermprop_expression_cvtermprop_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "expression_cvterm_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("expression_cvtermprop_id");
__PACKAGE__->add_unique_constraint("expression_cvtermprop_pkey", ["expression_cvtermprop_id"]);
__PACKAGE__->add_unique_constraint(
  "expression_cvtermprop_c1",
  ["expression_cvterm_id", "type_id", "rank"],
);
__PACKAGE__->belongs_to(
  "expression_cvterm_id",
  "Chado::Schema::Expression::ExpressionCvterm",
  { expression_cvterm_id => "expression_cvterm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6CcT5vwAquYBYHO+a+OHKw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
