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
StudyPeriod.create( :startdate => "09/01/2010", :enddate => "12/31/2010", :cursus_id => 1 )
StudyPeriod.create( :startdate => "01/01/2011", :enddate => "06/30/2011", :cursus_id => 1 )

#MBA
StudyPeriod.create( :startdate => "09/05/2010", :enddate => "01/05/2011", :cursus_id => 2 )
StudyPeriod.create( :startdate => "01/05/2011", :enddate => "07/05/2011", :cursus_id => 2 )

#Medicine
StudyPeriod.create( :startdate => "09/10/2010", :enddate => "01/10/2011", :cursus_id => 3 )
StudyPeriod.create( :startdate => "01/11/2011", :enddate => "07/05/2011", :cursus_id => 3 )

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
##Courses
###

courses=[]

#An example of an hash to create several courses in one time
#course = {:name => "CourseName", :study_period => 1
# :modalities => [ [Study_period_id, Volume] ] }

#Computer Science SP1
courses << {:name => "Ruby On Rails", :study_period => 1,
  :modalities => [ [1, 80], [2, 10], [3, 250], [4, 2], [5, 8] ] }
courses << {:name => "PHP", :study_period => 1,
  :modalities => [ [1, 20], [2, 13], [3, 180], [4, 3], [5, 6] ] }

#Computer Science SP2
courses << {:name => "J2EE", :study_period => 2,
  :modalities => [ [1, 15], [2, 20], [3, 200], [4, 4], [5, 8] ] }
courses << {:name => "ASP.net", :study_period => 2,
  :modalities => [ [1, 16], [2, 20], [3, 210], [4, 2], [5, 12] ] }


#MBA SP1
courses << {:name => "Finance", :study_period => 3,
  :modalities => [ [1, 165], [3, 10], [4, 4], [6, 0.5] ] }
courses << {:name => "Economy", :study_period => 3,
  :modalities => [ [1, 135], [3, 14], [4, 4], [6, 0.5] ] }

#MBA SP2
courses << {:name => "Management", :study_period => 4,
  :modalities => [ [1, 185], [2, 20] , [3, 24], [4, 2], [6, 1] ] }
courses << {:name => "Statistic", :study_period => 4,
  :modalities => [ [1, 128], [3, 12], [4, 4], [6, 1] ] }


#Medicine SP1
courses << {:name => "Biology", :study_period => 5,
  :modalities => [ [1, 80], [3, 80], [4, 8], [5, 2], [6, 1] ] }
courses << {:name => "Chemistry", :study_period => 5,
  :modalities => [ [1, 75], [3, 90], [4, 6], [5, 2], [6, 1] ] }

#Medicine SP2
courses << {:name => "Physics", :study_period => 5,
  :modalities => [ [1, 92], [3, 104], [4, 4], [5, 2], [6, 1] ] }
courses << {:name => "Anatomy", :study_period => 5,
  :modalities => [ [1, 88], [3, 112], [4, 6], [5, 3], [6, 1] ] }

courses.each do |course|
  course[:modalities].each do |modality|
    Course.create( :name =>course[:name], 
                    :volume => modality.last,
                    :study_period_id => course[:study_period],
                    :modality_id => modality.first )
  end
end

