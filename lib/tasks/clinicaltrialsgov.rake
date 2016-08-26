require 'csv'
require 'ClinicalTrialsGov'

# Rake tasks for handling data from clinicaltrials.gov
namespace :clinicaltrialsgov do

  # rake clinicaltrialsgov:import_csv["/app/data/study_fields.csv"]
  desc "Import trial records from a clinicaltrials.gov CSV export"
  task :import_csv, [:path] => :environment do |t, args|
    import_filename = args[:path]

    # Validate path
    raise "Arguments cannot be empty." if args.to_hash.length == 0
    raise "Please specify a CSV file path." if import_filename.empty?
    raise "Invalid file path specified." unless File.exists?(import_filename)

    # Open and process the CSV file
    CSV.foreach(import_filename, :headers => true) do |row|
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