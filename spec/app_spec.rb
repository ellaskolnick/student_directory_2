require_relative '../app'

RSpec.describe Application do
  it "runs with cohort Blueberries" do
    io = double :io
    student = double :student, name: "Harry Styles"
    student2 = double :student, name: "Taylor Swift"
    students = [student, student2]
    cohort = double :cohort, students: students, name: "Blueberries", starting_date: "2022-03-10", id: "1"
    cohort_repository = double :cohort_repository
    allow(cohort_repository).to receive(:find_with_students).with("1").and_return(cohort)
    app = Application.new('student_directory_2_test', io, cohort_repository)
    expect(io).to receive(:puts).with("Please enter the id of the cohort you wish to see:")
    expect(io).to receive(:gets).and_return("1\n")
    expect(io).to receive(:puts).with("Cohort: Blueberries - 2022-03-10")
    expect(io).to receive(:puts).with("Students:")
    expect(io).to receive(:puts).with("  * Harry Styles")
    expect(io).to receive(:puts).with("  * Taylor Swift")
    app.run
  end
end
