require 'cohort_repository'

def reset_students_table
  seed_sql = File.read('spec/seeds_students.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'students_test' })
  connection.exec(seed_sql)
end

RSpec.describe CohortRepository do
  before(:each) do
    reset_students_table
  end

  it "finds cohort 1 with it's students" do
    repo = CohortRepository.new
    cohort = repo.find_with_students(1)

    expect(cohort.name).to eq 'blueberries'
    expect(cohort.students.length).to eq 2
  end
end
