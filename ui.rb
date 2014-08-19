require 'active_record'
require './lib/employee'
require './lib/division'
require './lib/project'
require './lib/assignment'
require 'pry'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Welcome to Employee Tracker!"
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "Press '1' to add a employee."
    puts "Press '2' to list your employees."
    puts "Press '3' to add a division."
    puts "Press '4' to list your divisions."
    puts "Press '5' to add a project."
    puts "Press '6' to list projects."
    puts "Press '7' to add employee to project."
    puts "Press '8' to add employee to division."
    puts "Press '9' to add employee's contribution to project."
    puts "Press 'e' to Exit"
    choice = gets.chomp
    case choice
    when '1'
      add_employee
    when '2'
      list_employees
    when '3'
      add_division
    when '4'
      list_divisions
    when '5'
      add_project
    when '6'
      list_projects
    when '7'
      assign_employee_project
    when '8'
      assign_employee_division
    when '9'
      assign_employee_contribution
    when 'e'
      puts "Good-bye!"
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def add_employee
  puts "Employee name to add?"
  employee_name = gets.chomp
  employee = Employee.create(:name => employee_name)
  employee.save
end

def list_employees
  puts "Employees:"
  employees = Employee.all
  employees.each { |employee| puts "#{employee.id}. #{employee.name}" }
end

def add_division
  puts "Division to add?"
  division_name = gets.chomp
  division = Division.create(:name => division_name)
  division.save
end

def list_divisions
  puts "Divisions:"
  divisions = Division.all
  divisions.each { |division| puts "#{division.id}. #{division.name}" }
end

def add_project
  puts "Project to add?"
  project_name = gets.chomp
  project = Project.create(:name => project_name)
end

def list_projects
  puts "Projects:"
  projects = Project.all
  projects.each { |project| puts "#{project.id}. #{project.name}" }
end

def assign_employee_project
  list_employees
  puts "Employee_id?"
  employee = gets.chomp
  input_employee = Employee.find(employee)
  list_projects
  puts "Project_id?"
  project = gets.chomp
  input_project = Project.find(project)
  Assignment.create({:employee_id => input_employee.id, :project_id => input_project.id})
  puts "\n\n#{input_employee.name} is now assigned to #{input_project.name}.\n\n"
end

def assign_employee_division
  list_employees
  puts "Employee_id?"
  employee = gets.chomp
  input_employee = Employee.find(employee)
  list_divisions
  puts "Division_id?"
  division = gets.chomp
  input_division = Division.find(division)
  input_employee.update(division_id: division)
  puts "\n\n#{input_employee.name} is now assigned to #{input_division.name}.\n\n"
end

def assign_employee_contribution
  Assignment.all.each { |assignment| puts "#{assignment.id}. #{assignment.employee.name}: #{assignment.project.name}" }
  puts "Assignment_id?"
  assignment = gets.chomp
  input_assignment = Assignment.find(assignment)
  puts "Contribution employee made?"
  contribution = gets.chomp
  input_assignment.update(contribution: contribution)
  input_assignment = Assignment.find(assignment)
  puts "\n\n#{input_assignment.id}. #{input_assignment.employee.name} | #{input_assignment.project.name} | #{input_assignment.contribution}\n\n"
end

welcome
