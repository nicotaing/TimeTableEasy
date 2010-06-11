# rake db:migrate
# rake db:seed

###
# Campus
###

Campus.create(:name => "Paris", :city => "Paris")
Campus.create(:name => "Marseille", :city => "Marseille")
Campus.create(:name => "Caen", :city => "Caen")
Campus.create(:name => "San Francisco", :city => "San Francisco")
Campus.create(:name => "Miami", :city => "Miami")
Campus.create(:name => "Londres", :city => "Londres")

###
# Users
###

# Administrateurs
# admin@globus.com / password
User.find_or_create_by_email(
  :email => "admin@globus.com",
  :first_name => "Admin",
  :last_name  => "Globus",
  :password => "password",
  :password_confirmation => "password",
  :role => "admin"
).save!

# Campus-Manager
# paris@globus.com / password
User.find_or_create_by_email(
  :email => "paris@globus.com",
  :first_name => "CM",
  :last_name  => "Paris",
  :password => "password",
  :password_confirmation => "password",
  :role => "cm",
  :campus_id => Campus.find_by_name("Paris").id
).save!
# sf@globus.com / password
User.find_or_create_by_email(
  :email => "sf@globus.com",
  :first_name => "CM",
  :last_name  => "San Francisco",
  :password => "password",
  :password_confirmation => "password",
  :role => "cm",
  :campus_id => Campus.find_by_name("San Francisco").id
).save!

# Professeurs
#TODO

# Eleves
# fabien@globus.com / password
User.find_or_create_by_email(
  :email => "fabien@globus.com",
  :first_name => "Fabien",
  :last_name  => "Legoupillot",
  :password => "password",
  :password_confirmation => "password",
  :role => "student",
  :campus_id => Campus.find_by_name("Paris").id,
  :avatar_file_name => "fabien.png", 
  :avatar_content_type => "image/png", 
  :avatar_file_size => 50939, 
  :avatar_updated_at => "2010-06-08 07:34:48",
  :classe_id => 14
).save!
# sylvain@globus.com / password
User.find_or_create_by_email(
  :email => "sylvain@globus.com",
  :first_name => "Sylvain",
  :last_name  => "Kalache",
  :password => "password",
  :password_confirmation => "password",
  :role => "student",
  :campus_id => Campus.find_by_name("Paris").id,
  :avatar_file_name => "sylvain.jpeg", 
  :avatar_content_type => "image/jpeg", 
  :avatar_file_size => 50939, 
  :avatar_updated_at => "2010-06-08 07:34:48",
  :classe_id => 4
).save!
# stephane@globus.com / password
User.find_or_create_by_email(
  :email => "stephane@globus.com",
  :first_name => "Stéphane",
  :last_name  => "Rangaya",
  :password => "password",
  :password_confirmation => "password",
  :role => "student",
  :campus_id => Campus.find_by_name("San Francisco").id,
  :avatar_file_name => "stephane.png", 
  :avatar_content_type => "image/png", 
  :avatar_file_size => 50939, 
  :avatar_updated_at => "2010-06-08 07:34:48",
  :classe_id => 17
).save!
# nicolas@globus.com / password
User.find_or_create_by_email(
  :email => "nicolas@globus.com",
  :first_name => "Nicolas",
  :last_name  => "Taing",
  :password => "password",
  :password_confirmation => "password",
  :role => "student",
  :campus_id => Campus.find_by_name("San Francisco").id,
  :avatar_file_name => "nicolas.png", 
  :avatar_content_type => "image/jpeg", 
  :avatar_file_size => 50939, 
  :avatar_updated_at => "2010-06-08 07:34:48",
  :classe_id => 18
).save!

# mark@globus.com / password 
User.find_or_create_by_email(
  :email => "mark@globus.com",
  :first_name => "Mark",
  :last_name  => "Lusnar",
  :password => "password",
  :password_confirmation => "password",
  :role => "teacher",
  :campus_id => Campus.find_by_name("San Francisco").id,
  :avatar_file_name => "nicolas.png", 
  :avatar_content_type => "image/jpeg", 
  :avatar_file_size => 50939, 
  :avatar_updated_at => "2010-06-08 07:34:48"
).save!

### University Events
Event.create(
  :title => "House Party",
  :starttime => 1.day.from_now,
  :endtime => (1.day + 3.hours).from_now,
  :description => "Welcome!",
  :creator_id => User.find_by_email("admin@globus.com").id,
  :category => "university"
)
Event.create(
  :title => "Pic Nic",
  :starttime => 1.day.from_now,
  :endtime => (1.day + 3.hours).from_now,
  :description => "Welcome!",
  :creator_id => User.find_by_email("admin@globus.com").id,
  :category => "university"
)

### Campus Events
# Paris
Event.create(
  :title => "Paris",
  :starttime => 2.day.from_now,
  :endtime => (2.day + 1.hours).from_now,
  :description => "Welcome!",
  :creator_id => User.find_by_email("admin@globus.com").id,
  :campus_id => Campus.find_by_name("Paris").id,
  :category => "campus"
)

# San Francisco
Event.create(
  :title => "San Francisco",
  :starttime => 2.day.from_now,
  :endtime => (2.day + 1.hours).from_now,
  :description => "Welcome!",
  :creator_id => User.find_by_email("admin@globus.com").id,
  :campus_id => Campus.find_by_name("San Francisco").id,
  :category => "campus"
)

### Personal Events
Event.create(
  :title => "Cinema",
  :starttime => 1.day.from_now,
  :endtime => (1.day + 3.hours).from_now,
  :description => "Welcome!",
  :creator_id => User.find_by_email("fabien@globus.com").id,
  :category => "personal"
)
Event.create(
  :title => "Movies",
  :starttime => 3.day.from_now,
  :endtime => (3.day + 6.hours).from_now,
  :description => "Welcome!",
  :creator_id => User.find_by_email("fabien@globus.com").id,
  :category => "personal"
)

###
##Modalities
###
["Lectures", "E-Learning", "Pratical Case Studies"].each do |m|
  Modality.create( :name => m, :is_exam => false )
end
["Examinations", "Pratical Case Studies", "Individual Orals"].each do |m|
  Modality.create( :name => m, :is_exam => true )
end




###
#Cursus
###

["Computer Science", "MBA", "Medicine"].each do |cursus|
  Cursus.find_or_create_by_name(cursus)
end

###
##Study Period 
###

#Computer Science
StudyPeriod.create( :name => "Semester 1",:startdate => "09/01/2010", :enddate => "12/31/2010", :cursus_id => 1 )
StudyPeriod.create( :name => "Semester 2",:startdate => "01/01/2011", :enddate => "06/30/2011", :cursus_id => 1 )

#MBA
StudyPeriod.create( :name => "Semester 3",:startdate => "09/05/2010", :enddate => "01/05/2011", :cursus_id => 2 )
StudyPeriod.create( :name => "Semester 4",:startdate => "01/05/2011", :enddate => "07/05/2011", :cursus_id => 2 )

#Medicine
StudyPeriod.create( :name => "Semester 1",:startdate => "09/10/2010", :enddate => "01/10/2011", :cursus_id => 3 )
StudyPeriod.create( :name => "Semester 2",:startdate => "01/11/2011", :enddate => "07/05/2011", :cursus_id => 3 )

###
##Classes
###
Campus.all.each do |c|
  Classe.create(:name => "B1 #{c.name}", :campus_id => c.id, :study_period_id => 1)
  Classe.create(:name => "B2 #{c.name}", :campus_id => c.id, :study_period_id => 2)
  Classe.create(:name => "B3 #{c.name}", :campus_id => c.id, :study_period_id => 3)
  Classe.create(:name => "M1 #{c.name}", :campus_id => c.id, :study_period_id => 4)
  Classe.create(:name => "M2 #{c.name}", :campus_id => c.id, :study_period_id => 5)
end




###
##Courses
###

courses=[]

#An example of an hash to create several courses in one time
#course = {:name => "CourseName", :study_period => 1
# :modalities => [ [Study_period_id, Volume(min)] ] }

#Computer Science SP1
courses << {:name => "Ruby On Rails", :study_period => 1,
  :modalities => [ [1, 80*60], [2, 10*60], [3, 250*60], [4, 2*60], [5, 8*60] ] }
courses << {:name => "PHP", :study_period => 1,
  :modalities => [ [1, 20*60], [2, 13*60], [3, 180*60], [4, 3*60], [5, 6*60] ] }

#Computer Science SP2
courses << {:name => "J2EE", :study_period => 2,
  :modalities => [ [1, 15*60], [2, 20*60], [3, 200*60], [4, 4*60], [5, 8*60] ] }
courses << {:name => "ASP.net", :study_period => 2,
  :modalities => [ [1, 16*60], [2, 20*60], [3, 210*60], [4, 2*60], [5, 12*60] ] }


#MBA SP1
courses << {:name => "Finance", :study_period => 3,
  :modalities => [ [1, 165*60], [3, 10*60], [4, 4*60], [6, 0.5*60] ] }
courses << {:name => "Economy", :study_period => 3,
  :modalities => [ [1, 135*60], [3, 14*60], [4, 4*60], [6, 0.5*60] ] }

#MBA SP2
courses << {:name => "Management", :study_period => 4,
  :modalities => [ [1, 185*60], [2, 20*60] , [3, 24*60], [4, 2*60], [6, 1*60] ] }
courses << {:name => "Statistic", :study_period => 4,
  :modalities => [ [1, 128*60], [3, 12*60], [4, 4*60], [6, 1*60] ] }


#Medicine SP1
courses << {:name => "Biology", :study_period => 5,
  :modalities => [ [1, 80*60], [3, 80*60], [4, 8*60], [5, 2*60], [6, 1*60] ] }
courses << {:name => "Chemistry", :study_period => 5,
  :modalities => [ [1, 75*60], [3, 90*60], [4, 6*60], [5, 2*60], [6, 1*60] ] }

#Medicine SP2
courses << {:name => "Physics", :study_period => 5,
  :modalities => [ [1, 92*60], [3, 104*60], [4, 4*60], [5, 2*60], [6, 1*60] ] }
courses << {:name => "Anatomy", :study_period => 5,
  :modalities => [ [1, 88*60], [3, 112*60], [4, 6*60], [5, 3*60], [6, 1*60] ] }

courses.each do |course|
  course[:modalities].each do |modality|
    Course.create( :name =>course[:name], 
                    :volume => modality.last,
                    :study_period_id => course[:study_period],
                    :modality_id => modality.first )
  end
end

