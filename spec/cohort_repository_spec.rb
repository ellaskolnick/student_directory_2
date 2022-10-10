require 'cohort_repository'

RSpec.describe CohortRepository do
  it "finds cohort 1 with it's students" do
    repo = CohortRepository.new
    cohort = repo.find_with_students(1)

    expect(cohort.name).to eq 'blueberries'
    expect(cohort.students.length).to eq 2
  end
end
