require_relative '../lib/cohort.rb'
require_relative '../lib/student.rb'
require_relative '../lib/database_connection.rb'

class CohortRepository
  def find_with_students(id)
    sql = 'SELECT cohorts.id,
                  cohorts.name,
                  cohorts.starting_date,
                  students.id AS sudent_id,
                  students.name AS student_name
          FROM cohorts
          JOIN students ON students.cohort_id = cohorts.id
          WHERE cohorts.id =$1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)

    cohort = Cohort.new

    cohort.id = result.first['id']
    cohort.name = result.first['name']
    cohort.starting_date = result.first['starting_date']

    result.each do |record|
      student = Student.new
      student.id = record['student_id']
      student.name = record['student_name']

      cohort.students << student
    end

    cohort
  end
end
