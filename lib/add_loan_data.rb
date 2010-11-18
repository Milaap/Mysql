#require 'rubygems'
#require 'mongoid/railtie'
#require 'date'
#
#
#connection = Mongo::Connection.new
#if Rails.env == "development"
#  connection = Mongo::Connection.new
#  Mongoid.database = connection.db("milaap_development")
#elsif Rails.env == "staging"
#  connection = Mongo::Connection.new
#  Mongoid.database = connection.db("milaap_staging")
#elsif Rails.env == "production"
#  connection = Mongo::Connection.new
#  Mongoid.database = connection.db("milaap_production")
#end
#
#
#class Loan
#  include Mongoid::Document
#  include Mongoid::Timestamps
#  field :loan_id,:type => Integer
#  field :category_id, :type => Integer
#  field :category, :type => String
#  field :date_listed, :type => DateTime
#  field :expiry_date, :type => DateTime
#  field :title, :type => String
#  field :info, :type => String
#  field :amount, :type => Float
#  field :terms, :type => Integer
#  field :amount_funded, :type => Float,:default => 0.0
#  field :amount_remaining, :type => Float,:default => 0.0
#  field :repayment_cycle, :type => String
#  field :date_of_disbursement_of_loan, :type => DateTime
#  field :date_of_final_payment, :type => DateTime
#  field :amount_repaid, :type => Float,:default => 0.0
#  field :loan_status, :type => String
#  field :interest_rate, :type => Float
#  field :field_partner_id, :type => Integer
#  field :field_partner_name, :type => String
#  field :social_impact, :type => String
#  field :loan_impact_story, :type => String
#  field :loan_funded_percentage, :type => Float,:default => 0.0
#  field :loan_amount_in_dollar, :type => Float,:default => 0.0
#  field :loan_amount_remaining_in_dollar, :type => Float,:default => 0.0
#end
#
#
#class Borrower
#  include Mongoid::Document
#  include Mongoid::Timestamps
#  field :id, :type => Integer
#  field :borrower_group_id, :type => Integer
#  field :loan_id, :type => Integer
#  field :lender_id, :type => Integer
#  field :field_partner_id, :type => Integer
#  field :name, :type => String
#  field :gender, :type => String
#  field :age, :type => Integer
#  field :photo, :type => String
#  field :profile_image, :type => String
#  field :home_image, :type => String
#  field :search_image, :type => String
#  field :village, :type => String
#  field :taluka, :type => String
#  field :district, :type => String
#  field :state, :type => String
#  field :country, :type => String,:default=>"INDIA"
#  field :id, :type => String
#  field :education, :type => String
#  field :avg_monthly_income, :type => Float
#  field :occupation, :type => String
#  field :borrower_story, :type => String
#  field :poverty_level, :type => Float
#  field :credit_rating, :type => String
#  field :impact_story_image, :type => String
#  field :name_of_student, :type => String
#  field :relationship_with_applicant, :type => String
#end
#
#
#class BorrowerGroup
#  include Mongoid::Document
#  include Mongoid::Timestamps
#  embeds_many :borrowers
#  embeds_one  :loan
#  embeds_one  :filed_partner
#  field :id, :type => Integer
#  field :loan_id, :type => Integer
#  field :field_partner_id, :type => Integer
#  field :borrower_group_id, :type => Integer
#end
#
#
#class LoanRepayment
#  include Mongoid::Document
#  include Mongoid::Timestamps
#  embeds_one :loan
#  field :loan_id, :type => Integer
#  field :repayment_date, :type => DateTime
#  field :amount, :type => Float
#end
#class Category
#  include Mongoid::Document
#  include Mongoid::Timestamps
#  embeds_many :loans
#
#  field :category_id, :type => Integer
#  field :name, :type => String
#  field :permalink, :type => String
#
#
#end
#
#
#class Community
#  include Mongoid::Document
#  include Mongoid::Timestamps
#  embeds_many :borrowers
#
#  field :id, :type => Integer
#  field :name, :type => String
#  field :info, :type => String
#
#end
#
#
#
#
#
community1= Community.create(:id=>6,:name=>"Kalamb",:info=>'Kalamb is a city and a municipal council in Osmanabad district in the Indian state of Maharashtra.
As of 2001, India census, Kalamb had a population of 23,016. Males constitute 52% of the population and females 48%. Kalamb has an average literacy rate of 71%, higher than the national average of 59.5%: male literacy is 78%, and female literacy is 62%. In Kalamb, 15% of the population is under 6 years of age.Local MLA is Mr. Dayanand Gaikawad, Shivsena.')

Category.create(:name => 'HEALTH', :permalink => 'health')




borrower1 = Borrower.create(:id=>11,
:name=>"Indubai Kadam",
:gender=>"female",
:photo=>"indubai_kadam_11.jpg",
:village=>"Waghili",
:taluka=>"Kalamb",
:district=>"Osmanabad",
:state=>"Maharashtra",
:loan_id=>11,
:borrower_group_id=>11,
:field_partner_id=>1,
:borrower_story=>"4 months back, it was a tough time for Indubahi Kadam when her grandson, 4 year old Om, was detected with a tumour in the throat. The diagnosis was of a non-malignant tumour, but needed a quick surgery to prevent further complications. The next step was to garner funds for little Omi, who means a world to her since the last 4 years. The first help came form the members of the Gouri Mahila Self Help Group based out of her village Waghili in Kalamb Taluka of Osmanabad district.However, some additional funds were required quickly and she had to borrow from the local money lender. She then applied for a loan with Sakhi Samudaya Kosh to quickly pay off the other costly loans which she had to avail overnight. ",
:community_id=>community1.id
)

BorrowerGroup.create(:borrower_group_id=>11,:id=>11,:loan_id=>11,:field_partner_id=>1)


Loan.create(:id=>11,
:title => 'Surgery for the child',
   :category_id =>6,
   :amount=>20000,
   :amount_remaining=>0,
   :terms=>10,
   :repayment_cycle=>"monthly",
   :loan_status=>"Not Funded",
   :interest_rate=>0.22,
   :date_of_disbursement_of_loan=>Time.utc("2010", "sep", 22),
   :date_of_final_payment=>Time.utc("2010", "aug", 11),
   :date_listed=>Time.utc("2010", "oct", 01),
   :expiry_date=>Time.utc("2010", "oct", 31),
   :field_partner_name=>"Sakhi Samudhaya Kosh",
   :social_impact=>"HIGH",
   :social_impact_story=>"With your contribution Indubhai can return the money borrowed in an emergency and can reapy a softer loan with SSK. This would also help her buy medicines for Omi from the household income and not borrow further.")


LoanRepayment.create(:id=>11,:repayment_date=>Time.utc("2010", "nov", 11),:amount=>2000)
LoanRepayment.create(:id=>11,:repayment_date=>Time.utc("2010", "dec", 13),:amount=>2000)
LoanRepayment.create(:id=>11,:repayment_date=>Time.utc("2010", "jan", 12),:amount=>2000)
LoanRepayment.create(:id=>11,:repayment_date=>Time.utc("2010", "feb", 12), :amount=>2000)
LoanRepayment.create(:id=>11,:repayment_date=>Time.utc("2010", "mar", 13),:amount=>2000)
LoanRepayment.create(:id=>11,:repayment_date=>Time.utc("2010", "apr", 13),:amount=>2000)
LoanRepayment.create(:id=>11,:repayment_date=>Time.utc("2010", "may", 14),:amount=>2000)
LoanRepayment.create(:id=>11,:repayment_date=>Time.utc("2010", "jun", 13),:amount=>2000)
LoanRepayment.create(:id=>11,:repayment_date=>Time.utc("2010", "jul", 13),:amount=>2000)
LoanRepayment.create(:id=>11,:repayment_date=>Time.utc("2010", "aug", 12),:amount=>2000)



Borrower.create(:id=>12,
:name=>"Rajeshree Mali",
:gender=>"female",
:photo=>"rajashri_mali_13.jpg",
:village=>"Tuljapur",
:taluka=>"Tuljapur",
:district=>"Osmanabad",
:state=>"Maharashtra",
:loan_id=>12,
:borrower_group_id=>12,
:field_partner_id=>1,
:borrower_story=>"Rajeshree Mali, lovingly known as Rajjo Di, lives in the Tuljapur district of Osmanabad. Her family doesn't own any land, and she and her two children are dependent on her husband, who is employed with a private enterprise. He has always been supportive of her ventures. Along with another business that she runs, she decided to start working with the Sakhi retail a few years back. She invested some of their savings to begin with, and business has since then grown. She now places an order a month for 7500 Rupees. 10 hours of work a week gets her around 1000 Rupees (US$ 20) a month, which she puts aside for her children. Needless to say, she wants to save more for their future.Going to new villages will help her increase her sales, This means adding more products to her existing range,both in type and quantity, and placing more number of orders. This expansion, which will cost her 10,000 Rupees, she estimates, will help her increase her profit by about 2000 Rupees (~US$45)",
:community_id=>Community.id,
:impact_story_image=>"rajshree.png"
)

BorrowerGroup.create(:borrower_group_id=>12,:id=>12,:loan_id=>12,:field_partner_id=>1)


Loan.create(:id=>12,
   :title => 'Delivering energy efficient lights',
   :category_id =>5,
   :amount=>10000,
   :amount_remaining=>0,
   :terms=>12,
   :repayment_cycle=>"monthly",
   :loan_status=>"Not Funded",
   :interest_rate=>0.12,
   :date_of_disbursement_of_loan=>Time.utc("2010", "aug", 24),
   :date_of_final_payment=>Time.utc("2011", "aug", 24),
   :date_listed=>Time.utc("2010", "oct", 01),
   :expiry_date=>Time.utc("2010", "oct", 31),
   :field_partner_name=>"Sakhi Samudhaya Kosh",
   :social_impact=>"HIGH",
   :social_impact_story=>""
   )


LoanRepayment.create(:loan_id=>12,:repayment_date=>Time.utc("2010", "sep", 24),:amount=>834)
LoanRepayment.create(:loan_id=>12,:repayment_date=>Time.utc("2010", "oct", 26),:amount=>834)
LoanRepayment.create(:loan_id=>12,:repayment_date=>Time.utc("2010", "nov", 25),:amount=>834)
LoanRepayment.create(:loan_id=>12,:repayment_date=>Time.utc("2010", "dec", 25),:amount=>834)
LoanRepayment.create(:loan_id=>12,:repayment_date=>Time.utc("2011", "jan", 24),:amount=>834)
LoanRepayment.create(:loan_id=>12,:repayment_date=>Time.utc("2011", "feb", 24),:amount=>834)
LoanRepayment.create(:loan_id=>12,:repayment_date=>Time.utc("2011", "mar", 27),:amount=>834)
LoanRepayment.create(:loan_id=>12,:repayment_date=>Time.utc("2011", "apr", 26),:amount=>834)
LoanRepayment.create(:loan_id=>12,:repayment_date=>Time.utc("2011", "may", 26),:amount=>834)
LoanRepayment.create(:loan_id=>12,:repayment_date=>Time.utc("2011", "jun", 25),:amount=>834)
LoanRepayment.create(:loan_id=>12,:repayment_date=>Time.utc("2011", "jul", 25),:amount=>834)
LoanRepayment.create(:loan_id=>12,:repayment_date=>Time.utc("2011", "aug", 24),:amount=>834)




Borrower.create(:id=>13,
:name=>"Chandrakala Bhalapure",
:gender=>"female",
:photo=>"chadrakala_bhalapure_12.jpg",
:village=>"Shiradhone",
:taluka=>"Solapur",
:district=>"Solapur",
:state=>"Maharashtra",
:loan_id=>13,
:borrower_group_id=>13,
:field_partner_id=>1,
:borrower_story=>"Chandrika Bhulapure is from the Shiradhone village in the Solapur district of Maharashtra. Her husband holds a day job as a government employee, and her two children are still in school. They have a small area for farming. Around 4 years back, she decided to start something on her own, and hence got involved in Sakhi retail. She wanted to start small, and worked with her family savings. Right now, her portfolio comprises of the Oorja range, and hence her profits are only around 500 Rupees (~US$10) a month. She works an average of 25 hours a week towards this. An expansion -- she'll add new products to her range and will travel to nearby villages for sales -- will cost her 10,000 rupees (US$200) more. The gains of 1500 Rupees (~US$30) more a month will contribute substantially towards savings for her family.",
:community_id=>community1.id,
:impact_story_image=>"chandrkala.png"
)

BorrowerGroup.create(:borrower_group_id=>13,:id=>13,:loan_id=>13,:field_partner_id=>1)


Loan.create(:id=>13,
   :title => 'Distribute smokeless cook stoves',
   :category_id =>5,
   :amount=>10000,
   :amount_remaining=>0,
   :terms=>12,
   :repayment_cycle=>"monthly",
   :loan_status=>"Not Funded",
   :interest_rate=>0.12,
   :date_of_disbursement_of_loan=>Time.utc("2010", "aug", 24),
   :date_listed=>Time.utc("2010", "oct", 01),
   :expiry_date=>Time.utc("2010", "oct", 31),
   :field_partner_name=>"Sakhi Samudhaya Kosh",
   :social_impact=>"HIGH",
   :social_impact_story=>""
   )


LoanRepayment.create(:loan_id=>13,:repayment_date=>Time.utc("2010", "sep", 24),:amount=>834)
LoanRepayment.create(:loan_id=>13,:repayment_date=>Time.utc("2010", "oct", 26),:amount=>834)
LoanRepayment.create(:loan_id=>13,:repayment_date=>Time.utc("2010", "nov", 25),:amount=>834)
LoanRepayment.create(:loan_id=>13,:repayment_date=>Time.utc("2010", "dec", 25),:amount=>834)
LoanRepayment.create(:loan_id=>13,:repayment_date=>Time.utc("2011", "jan", 24),:amount=>834)
LoanRepayment.create(:loan_id=>13,:repayment_date=>Time.utc("2011", "feb", 24),:amount=>834)
LoanRepayment.create(:loan_id=>13,:repayment_date=>Time.utc("2011", "mar", 27),:amount=>834)
LoanRepayment.create(:loan_id=>13,:repayment_date=>Time.utc("2011", "apr", 26),:amount=>834)
LoanRepayment.create(:loan_id=>13,:repayment_date=>Time.utc("2011", "may", 26),:amount=>834)
LoanRepayment.create(:loan_id=>13,:repayment_date=>Time.utc("2011", "jun", 25),:amount=>834)
LoanRepayment.create(:loan_id=>13,:repayment_date=>Time.utc("2011", "jul", 25),:amount=>834)
LoanRepayment.create(:loan_id=>13,:repayment_date=>Time.utc("2011", "aug", 24),:amount=>834)



@borrower = Borrower.first(:conditions => {:id =>10})
@borrower.borrower_story = "Priyanka Munde, daugther of Meenakshi and Anant Munde, needs funding to continue her studies and finish secondary school. Meenakshi Munde is a home maker, taking care of her husband, Anant Munde and son,Yogesh (standard 12th) and daughter, Priyanka (standard 11th). Meenakshi herself has studied only till 7th standard. Her husband holds a degree in master of commerce, is working with a factory and also has a farmland. Money from his occupation in the factory and farm takes care of the household and their children's education. Family's Financials: 1) Anant Munde's income from services at the factory, INR 108000 p.a and from farming an additional INR 60000 p.a. Credit History: No prior Loan"
@borrower.save


@borrower = Borrower.first(:conditions => {:id =>9})
@borrower.borrower_story = "Vishal Dattatrey, son of Surekha Dattatrey needs funds to pursue his higher studies. Surekha is a homemaker, taking care of her daughter Smita (25) , son Vishal (21) and husband Dattatrey Shayamrao More. Dattatrey is a graduate working with an private organisation. He is the bread winner of the family and has been supporting the household and his daugthers' education. their eldest daughter is B. Ed and looking for a job. Vishal is still pursuing his education. Family's financial: Dattatrey earns about INR 2,16000 p.a. prospective source of income: Smita's salary are a teacher Credit History: No prior Loan"
@borrower.save


@borrower = Borrower.first(:conditions => {:id =>8})
@borrower.borrower_story = "Sudhir Kale, son of Suvarna Kale wants to do an MBA. Suvarna Kale is married to Navnath Kale (55) who holds a diploma and works as a serviceman. They have three sons aged 25, 23 and 20. All are studying. The eldest son, Sudhakar has done his automobile engineering and is working with a small firm. The two younger sons, Suhas and Sudhir are pursuing a course in English. One is doing his masters the other one is in his undergraduation. The father had supported his eldest sons education through his salary. The eldest sons now supports the household expenditure and the education of his two brothers. The middle son who has completed his masters and has been partially supporting the family financially. Youngest son Sudhir Kale now wants to pursue his MBA. Family's Financials: Navnath Kale earns about INR 120000 p.a, Sudhakar Navnath (25) earns about INR 120000 p.a and Suhas (23) earns INR 24000 p.a. Credit History: No prior loan."
@borrower.save




















































p "****************************************"
p "********** Data added successfully *************"




#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
