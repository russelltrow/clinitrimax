require 'csv'
require 'ClinicalTrialsGov'

# Rake tasks for handling data from clinicaltrials.gov
namespace :clinicaltrialsgov do

  desc "Import trial records from a clinicaltrials.gov CSV export"
  task import_csv: :environment do
    CSV.foreach(Rails.root.join('data').to_s + "/study_fields.csv", :headers => true) do |row|
      begin
        trial_record = row.to_hash

        ctgov = ClinicalTrialsGov.new
        trial = ctgov.process_trial_record(trial_record)

        puts "Publishing Trial to Queue: #{trial['identifier']}"
        Publisher.publish("trials", trial, 'trial')
      rescue Exception => e
        puts "Error handling Trial record: #{trial_record.inspect}"
        puts e.inspect
      end
    end
  end

end