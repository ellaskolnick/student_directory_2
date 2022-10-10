require_relative 'lib/database_connection'
require_relative 'lib/cohort_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('student_directory_2')

class Application
  def initialize(database_name, io, cohort_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @cohort_repository = cohort_repository
  end

  def run
    id = prompt "Please enter the id of the cohort you wish to see:"
    print_cohort(id)
  end

  private

  def show(message)
    @io.puts(message)
  end

  def prompt(message)
    @io.puts(message)
    @io.gets.chomp
  end

  def print_cohort(id)
    cohort = @cohort_repository.find_with_students(id)
    show "Cohort: #{cohort.name.capitalize} - #{cohort.starting_date}"
    show "Students:"
    cohort.students.each do |student|
      show "  * #{student.name}"
    end
  end
end

if __FILE__ == $0
  app = Application.new(
    'student_directory_2',
    Kernel,
    CohortRepository.new
  )
  app.run
end
