require "json"

# docker-compose run -e "WORKERS=TrialsWorker" app rake sneakers:run
class TrialsWorker
  include Sneakers::Worker

  from_queue "trials", env: nil

  def work(message)
    begin
      trial_message = JSON.parse(message)
    rescue Exception => e
      puts "Failed to decode Trial: #{message.inspect}"
    end

    # Create a new trial record
    trial = Trial.new
    trial.name = trial_message["trial"]["name"]
    trial.identifier = trial_message["trial"]["identifier"]
    trial.status = trial_message["trial"]["status"]
    trial.enrollment = trial_message["trial"]["enrollment"]
    trial.first_received_on = trial_message["trial"]["first_received_on"]
    trial.timestamp = trial_message["trial"]["first_received_on"]
    trial.started_on = trial_message["trial"]["started_on"]
    trial.completed_on = trial_message["trial"]["completed_on"]
    trial.outcome_measures = trial_message["trial"]["outcome_measures"]
    trial.URL = trial_message["trial"]["URL"]

    puts trial.inspect
    trial.save
  end
end
