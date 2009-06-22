package Chado::Schema::Genetic::PhenotypeComparison;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("phenotype_comparison");
__PACKAGE__->add_columns(
  "phenotype_comparison_id",
  {
    data_type => "integer",
    default_value => "nextval('phenotype_comparison_phenotype_comparison_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "genotype1_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "environment1_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "genotype2_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "environment2_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "phenotype1_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "phenotype2_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "pub_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "organism_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("phenotype_comparison_id");
__PACKAGE__->add_unique_constraint("phenotype_comparison_pkey", ["phenotype_comparison_id"]);
__PACKAGE__->add_unique_constraint(
  "phenotype_comparison_c1",
  [
    "genotype1_id",
    "environment1_id",
    "genotype2_id",
    "environment2_id",
    "phenotype1_id",
    "pub_id",
  ],
);
__PACKAGE__->belongs_to(
  "environment2_id",
  "Chado::Schema::Genetic::Environment",
  { environment_id => "environment2_id" },
);
__PACKAGE__->belongs_to(
  "genotype1_id",
  "Chado::Schema::Genetic::Genotype",
  { genotype_id => "genotype1_id" },
);
__PACKAGE__->belongs_to(
  "environment1_id",
  "Chado::Schema::Genetic::Environment",
  { environment_id => "environment1_id" },
);
__PACKAGE__->belongs_to(
  "genotype2_id",
  "Chado::Schema::Genetic::Genotype",
  { genotype_id => "genotype2_id" },
);
__PACKAGE__->has_many(
  "phenotype_comparison_cvterms",
  "Chado::Schema::Genetic::PhenotypeComparisonCvterm",
  {
    "foreign.phenotype_comparison_id" => "self.phenotype_comparison_id",
  },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SdOK9jAiTOdfmlKVhMdyUA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
