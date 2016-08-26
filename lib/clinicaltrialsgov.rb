class ClinicalTrialsGov
  # New label => Old label
  @@trial_fields = { "name" => "Title", "identifier" => "NCT_Number", "status" => "Recruitment",
                     "phases" => "Phases", "interventions" => "Interventions",
                     "conditions" => "Conditions", "sponsors" => "Sponsor_Collaborators",
                     "age_groups" => "Age Groups", "study_types" => "Study Types",
                     "enrollment" => "Enrollment", "first_received_on" => "First_Received",
                     "started_on" => "Start Date", "completed_on" => "Completion Date",
                     "outcome_measures" => "Outcome Measures", "URL" => "URL" }

  def process_trial_record(record)
    trial = extract_trial_record_values(record)
    trial["source"] = "clinicaltrials.gov" unless trial.empty?
    trial
  end

  private

  # Extract all the specified fields from the trial record
  def extract_trial_record_values(record)
    output = {}

    @@trial_fields.each do |new_label, old_label|
      unless record[old_label].blank?
        output[new_label] = record.delete(old_label)

        # Check whether the field has nested values
        if output[new_label].include? "|"
          output[new_label] = split_nested_values(output[new_label])
        end

      end
    end

    output
  end

  # Split any nested values in the record
  def split_nested_values(field)
    nested_values = []

    field.split("|").each do |value|
      nested_values << value
    end

    nested_values
  end
end
