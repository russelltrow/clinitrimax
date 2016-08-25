require "rails_helper"
require "rake"

describe "clinicaltrialsgov namespace rake task" do
  before :all do
    Rake.application.rake_require "tasks/clinicaltrialsgov"
    Rake::Task.define_task(:environment)
  end

  describe "clinicaltrialsgov:import_csv" do
    before do
      # BarOutput.stub(:banner)
    end

    let :run_rake_task do
      Rake::Task["clinicaltrialsgov:import_csv"].reenable
      Rake.application.invoke_task "clinicaltrialsgov:import_csv[/app/data/study_fields.csv]"
    end

    it "processes all the trial records" do
      # pending "Need to figure out how to mock Bunny"
    end
  end
end
