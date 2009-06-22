package Chado::Schema::Expression::FeatureExpression;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("feature_expression");
__PACKAGE__->add_columns(
  "feature_expression_id",
  {
    data_type => "integer",
    default_value => "nextval('feature_expression_feature_expression_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "expression_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "pub_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("feature_expression_id");
__PACKAGE__->add_unique_constraint(
  "feature_expression_c1",
  ["expression_id", "feature_id", "pub_id"],
);
__PACKAGE__->add_unique_constraint("feature_expression_pkey", ["feature_expression_id"]);
__PACKAGE__->belongs_to(
  "expression_id",
  "Chado::Schema::Expression::Expression",
  { expression_id => "expression_id" },
);
__PACKAGE__->has_many(
  "feature_expressionprops",
  "Chado::Schema::Expression::FeatureExpressionprop",
  { "foreign.feature_expression_id" => "self.feature_expression_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kbJaTdu7QJF7315L4igwZA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
