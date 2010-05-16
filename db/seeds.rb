###
# Campus
###

Campus.create()




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

