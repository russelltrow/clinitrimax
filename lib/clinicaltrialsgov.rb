class ClinicalTrialsGov

  # Rank,NCT_Number,Title,Recruitment,Study Results,Conditions,Interventions,Sponsor_Collaborators,Gender,Age Groups,
  # Phases,Enrollment,Funded Bys,Study Types,Study Designs,Other IDs,First_Received,Start_Date,Completion Date,Last Updated,Last Verified,
  # Results First Received,Acronym,Primary Completion Date,Outcome Measures,URL

  # New label => Old label
  @trial_label_transforms = { 'name' => 'Title', 'identifier' => 'NCT_Number', 'status' => 'Recruitment',
                              'study_types' => 'Study Types', 'enrollment' => 'Enrollment',
                              'first_received' => 'First_Received', 'start_date' => 'Start Date',
                              'completion_date' => 'Completion Date', 'outcome_measures' => 'Outcome Measures',
                              'URL' => 'URL' }

  def process_trial_record(record)
    trial = extract_trial_record_values(record)
    trial['source'] = 'clinicaltrials.gov'

    trial['phases'] = extract_nested_values(record, 'Phases')
    trial['interventions'] = extract_nested_values(record, 'Interventions')
    trial['conditions'] = extract_nested_values(record, 'Conditions')
    trial['sponsors'] = extract_nested_values(record, 'Sponsor_Collaborators')
    trial['age_groups'] = extract_nested_values(record, 'Age Groups')
    trial['study_types'] = extract_nested_values(record, 'Study Types')

    return trial
  end

  def extract_trial_record_values(record)
    output = Hash.new

    unless @trial_label_transforms.blank?
      @trial_label_transforms.each do |new_label, old_label|
        output[new_label] = record.delete(old_label)
      end
    end

    return output
  end

  def extract_nested_values(record, type)
    output = Array.new

    unless record[type].nil?
      record[type].split('|').each do |value|
        puts "#{type}: #{value}"
        output << value
      end
    end

    return output
  end

end