class Trial
  include Neo4j::ActiveNode

  # Properties
  # id_property :identifier
  property :name
  property :identifier
  property :status
  property :enrollment
  property :first_received_on, type: Date
  property :timestamp
  property :started_on, type: Date
  property :completed_on, type: Date
  property :outcome_measures
  property :URL

  # Relationships
  # has_many :out, :age_groups, type: :TESTED_WITH
  # has_many :out, :conditions, type: :TARGETS
  # has_many :out, :phases, type: :IS_IN
  # has_many :out, :interventions, type: :TESTS
  # has_many :out, :sponsors, type: :SPONSORS
  # has_many :out, :study_types, type: :TYPE
end
