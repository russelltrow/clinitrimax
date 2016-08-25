require "rails_helper"
require "ClinicalTrialsGov"

RSpec.describe ClinicalTrialsGov do
  before :all do
    @trial_record = { "Rank" => "10", "NCT_Number" => "NCT02752152", "Title" => "Counseling for HIV and STIs Screening",
                      "Recruitment" => "Recruiting", "Study Results" => "No Results Available",
                      "Conditions" => "HIV, Hepatitis B, Hepatitis C and Syphilis Infections",
                      "Interventions" => "Behavioral: Computer-assisted counseling|Behavioral: Standard counseling",
                      "Sponsor_Collaborators" => "Institut de Recherche pour le Developpement|Chiang Mai University|Expertise France",
                      "Gender" => "Both", "Age Groups" => "Adult|Senior", "Phases" => "Phase 1|Phase 2", "Enrollment" => "1600",
                      "Funded Bys" => "Other", "Study Types" => "Interventional",
                      "Study Designs" => "Primary Purpose: Prevention|Masking: Open Label",
                      "Other IDs" => "Lightning", "First_Received" => "April 22, 2016", "Start_Date" => "Dec-15",
                      "Completion Date" => "Feb-19", "Last Updated" => "April 22, 2016", "Last Verified" => "Apr-16",
                      "Results First Received" => "No Study Results Posted", "Acronym" => "Lightning",
                      "Primary Completion Date" => "Jan-19",
                      "Outcome Measures" => "Proportion of participants in at-risk populations coming for a HIV re-test",
                      "URL" => "https://ClinicalTrials.gov/show/NCT02752152" }
  end

  context "with a valid Trial record from ct.gov" do
    describe ".process_trial_record" do
      it "processes the record succesfully" do
        ctgov = ClinicalTrialsGov.new
        trial = ctgov.process_trial_record(@trial_record)

        expect(trial["name"]).to match("Counseling for HIV and STIs Screening")
        expect(trial["identifier"]).to match("NCT02752152")
        expect(trial["phases"]).to eq(["Phase 1", "Phase 2"])
      end
    end
  end
end
