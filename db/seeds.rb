# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  Occupation.create!(name: 'Academic')
  Occupation.create!(name: 'Actor')
  Occupation.create!(name: 'Artist')
  Occupation.create!(name: 'Doctor')
  Occupation.create!(name: 'Librarian')
  Occupation.create!(name: 'Student')
  Occupation.create!(name: 'Accountant')
  Occupation.create!(name: 'Architect')
  Occupation.create!(name: 'Dentist')
  Occupation.create!(name: 'Economists')
  Occupation.create!(name: 'Writer')
  Occupation.create!(name: 'Engineer')
  Occupation.create!(name: 'Lawyer')
  Occupation.create!(name: 'Nurse')
  Occupation.create!(name: 'Pharmacist')
  Occupation.create!(name: 'Physician')
  Occupation.create!(name: 'Physiotherapist')
  Occupation.create!(name: 'Psychologist')
  Occupation.create!(name: 'Scientist')
  Occupation.create!(name: 'Social worker')
  Occupation.create!(name: 'Statistician')
  Occupation.create!(name: 'Surgeon')
  Occupation.create!(name: 'Teacher')
  Occupation.create!(name: 'Math Professor')
  Occupation.create!(name: 'Bank Examiner')
  Occupation.create!(name: 'Museum Curator')
  Occupation.create!(name: 'Casino Dealer')
  
  
  User.transaction do
user = User.create!(title: 'Mr',
					firstname: 'Stoyko',
                      surname: 'Abrashev',
                      dateofbirth: '08-11-1990',
                      phone: '07879350222',
					  licencetype: true,
                      licenceperiod: 5,
					  occupation_id:1)
  UserDetail.create!(email: 'admin@abv.bg',
                     password: 'taliesin',
                     user: user)
					 Address.create!(street:'Hristo Botev',
					 city: 'Karlovo',
					 county: 'Plovdiv',
					 postcode:'sy24 5be',
					 user: user)
usera = User.create!(title: 'Mr',
					firstname: 'Kaloyan',
                      surname: 'Donchev',
                      dateofbirth: '06-10-1989',
                      phone: '019706254',
					  licencetype: true,
                      licenceperiod: 19,
					  occupation_id:2)
					  
  UserDetail.create!(email: 'crazy@abv.bg',
                     password: 'donk7',
                     user: usera)
Address.create!(street:'King Street',
					 city: 'London',
					 county: 'UK',
					 postcode: 'sy23 4pp',
					 user: usera)		
Incident.create!(dateofincident: '12-12-2005',valueofclaim: 3000,typeofincident: 'road',description: 'some guy hit me',user: usera)
usera = User.create!(title: 'Miss',
					firstname: 'Elena',
                      surname: 'Petrova',
                      dateofbirth: '12-11-1976',
                      phone: '07698356241',
					  licencetype: true,
                      licenceperiod: 19,
					  occupation_id:2)
					  
  UserDetail.create!(email: 'elena@abv.bg',
                     password: 'elena7e7',
                     user: usera)
Address.create!(street:'Bond Street',
					 city: 'Manchester',
					 county: 'UK',
					 postcode: 'sy23 3pg',
					 user: usera)		 					 
			
			end