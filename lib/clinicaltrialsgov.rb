class ClinicalTrialsGov
  # New label => Old label
  @@trial_label_transforms = { 'name' => 'Title', 'identifier' => 'NCT_Number', 'status' => 'Recruitment',
                              'enrollment' => 'Enrollment', 'first_received_on' => 'First_Received',
                              'started_on' => 'Start Date', 'completed_on' => 'Completion Date',
                              'outcome_measures' => 'Outcome Measures', 'URL' => 'URL' }

  def process_trial_record(record)
    trial = extract_trial_record_values(record)

    trial['phases'] = extract_nested_records(record, 'Phases')
    trial['interventions'] = extract_nested_records(record, 'Interventions')
    trial['conditions'] = extract_nested_records(record, 'Conditions')
    trial['sponsors'] = extract_nested_records(record, 'Sponsor_Collaborators')
    trial['age_groups'] = extract_nested_records(record, 'Age Groups')
    trial['study_types'] = extract_nested_records(record, 'Study Types')
    trial['source'] = 'clinicaltrials.gov'

    return trial
  end

private

  def extract_trial_record_values(record)
    output = Hash.new
    unless @@trial_label_transforms.blank?
      @@trial_label_transforms.each do |new_label, old_label|
        output[new_label] = record.delete(old_label)
      end
    end

    return output
  end

  def extract_nested_records(record, type)
    output = Array.new
    unless record[type].nil?
      record[type].split('|').each do |value|
        output << value
      end
    end

    return output
  end

end