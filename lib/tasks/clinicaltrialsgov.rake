require 'csv'
require 'ClinicalTrialsGov'

namespace :clinicaltrialsgov do

  desc "Import clinical trials from a ct.gov export"
  task import_csv: :environment do

    CSV.foreach(Rails.root.join('data').to_s + "/study_fields.csv", :headers => true) do |row|
      begin
        record = row.to_hash

        ctgov = ClinicalTrialsGov.new
        trial = ctgov.process_trial_record(record)

        puts "Publishing Trial to Queue: #{trial['identifier']}"
        Publisher.publish("trials", trial, 'trial')

      rescue Exception => e
        puts e.inspect
      end
    end
  end

end