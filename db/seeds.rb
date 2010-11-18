# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])

Category.create(:name => 'Water', :permalink => 'water')
Category.create(:name => 'Sanitation',:permalink => 'sanitation')
Category.create(:name => 'Education',  :permalink => 'education')
Category.create(:name => 'Energy', :permalink => 'energy')
Category.create(:name => 'Microfranchisee', :permalink => 'microfranchisee')


FieldPartner.create(:field_partner_id=>1,
   :name=>"Sakhi Samudhaya Kosh",
   :url=>"www.sskindia.com",
   :logo=>"ssk_logo.png",
   :information=>"SSK provides a range of socially relevant financial services to the most underserved segments of Indian society. Sakhi Samudaya Kosh    (SSK) is a financial entity which provides innovative community driven financial services to a self help group (SHG) members.",
   :field_partner_type=>"Non-profit Company",
   :total_loan_portfolio=>"129.55 Mn INR",
   :lending_rate=>"12% - 22%",
   :repayment_rate=>0.978,
   :total_no_of_borrowers=>12955,
   :no_of_SHGS=>3167,
   :no_of_villages=>792,
   :no_of_districts_operating=>7,
   :no_of_poorest_districts=>2,
   :percentage_of_women_borrowers=>1)



FieldPartner.create(:field_partner_id=>2,
   :name=>"GUARDIAN",
   :information=>"GUARDIAN is an acronym of Gramalaya urban and rural development initiatives and network, a micro finance institution (MFI) and a not for profit organization with no capital, registered under Sec. 25 of Companies Act 1956 was came into existence from 6.11.2007 with its Administrative office at Raja colony, Trichy and it was promoted by Gramalaya NGO, which is pioneer in the field of water and sanitation for more than 2 decades in Tiruchirapalli District.",
   :field_partner_type=>"Non-profit Company",
   :url=>"www.guardianmfi.org",
   :total_loan_portfolio=>"96.659m",
   :lending_rate=>"0.18",
   :credit_rating =>"Beta Plus",
   :rating_agency=>"M-CRIL",
   :repayment_rate=>0.9999,
   :total_no_of_borrowers=>13424,
   :no_of_districts_operating=>1,
   :no_of_poorest_districts=>0,
   :percentage_of_women_borrowers=>1)


Borrower.create(:name=>"Nirmala Shah",
 :gender=>"female",
 :photo=>"7.Nirmala_Prakash_Shah.jpg",
 :village=>"Akluj",
 :taluka=>"Malshiras",
 :district=>"Solapur",
 :state=>"Maharashtra",
 :loan_id=>1,
 :borrower_group_id=>1,
 :field_partner_id=>1,
 :borrower_story=>"Nirmala Prakash Shah is from the Akluj Village near Solapur. She has been working with Sakhi retail for nearly 4 years. Her retailing business hands her a decent monthly income of 2,000 Rupees (~$45) a month. Her husband is currently working for a small private company. They also own around 2.5 acres of land yet persistent drought conditions meant little or no farming activity. She doesn't have any children yet, and so all the money earned goes towards savings.",
 :community_id=>2,
 :poverty_level=>0.85,
 :impact_story_image=>"nirmalshah.PNG"
 )

BorrowerGroup.create(:id=>1,:loan_id=>1,:field_partner_id=>1)


Loan.create(:id=>1,
   :title => 'Retail organic fertilizers',
   :category_id =>5,
   :amount=>10000,
   :amount_remaining=>0,
   :terms=>12,
   :repayment_cycle=>"monthly",
   :loan_status=>"Repaying",
   :interest_rate=>0.12,
   :date_of_disbursement_of_loan=>"2010-07-24 10:02:53 UTC",
   :date_of_final_payment=>"2011-07-23 10:02:53 UTC",
   :date_listed=>"2010-06-16 10:02:53 UTC",
   :expiry_date=>"2010-07-15 10:02:53 UTC",
   :field_partner_name=>"Sakhi Samudhaya Kosh",
   :social_impact=>"HIGH",
   :social_impact_story=>"Now that the business is stable, she's looking at an expansion. To be able to generate an additional income of 5,000 Rupees she needs to add new products like D.Light and OGP to her range, for which needs a loan of 10,000. The additional income from this will go towards saving for the future of her family.")


LoanRepayment.create(:loan_id=>1,:repayment_date=>"2010-08-23 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>1,:repayment_date=>"2010-09-24 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>1,:repayment_date=>"2010-10-24 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>1,:repayment_date=>"2010-11-23 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>1,:repayment_date=>"2010-12-23 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>1,:repayment_date=>"2011-01-23 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>1,:repayment_date=>"2011-02-23 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>1,:repayment_date=>"2011-03-25 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>1,:repayment_date=>"2011-04-24 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>1,:repayment_date=>"2011-05-24 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>1,:repayment_date=>"2011-06-23 10:02:53 UTC",:amount=>935)




Borrower.create(:name=>"Parwati Kamal Birajdar",
 :gender=>"female",
 :photo=>"5.Kamal Birajdar.JPG",
 :village=>"Darganhali",
 :taluka=>"South Solapur",
 :district=>"Solapur",
 :state=>"Maharashtra",
 :loan_id=>2,
 :borrower_group_id=>2,
 :field_partner_id=>1,
 :borrower_story=>"Kamal Birajdar who hails from the Dargahalli village in Solapur district, earns about 1000 rupees (~ S$30) a month by retailing products from the Sakhi range. Her husband owns farmland, and that is the main source of income for the family. Her primary concern is to secure the future of her two children by offering them the best education, as well as save a little.",
 :community_id=>4,
 :poverty_level=>0.68,
 :impact_story_image=>"kamalbirajdar.PNG"
  )


BorrowerGroup.create(:id=>2,:loan_id=>2,:field_partner_id=>1)



Loan.create(:id=>2,
   :title => 'Deliver affordable solar lighting',
   :category_id =>5,
   :amount=>10000,
   :amount_remaining=>0,
   :terms=>12,
   :repayment_cycle=>"monthly",
   :loan_status=>"Repaying",
   :interest_rate=>0.12,
   :date_of_disbursement_of_loan=>"2010-07-24 10:02:53 UTC",
   :date_of_final_payment=>"2011-07-23 10:02:53 UTC",
   :date_listed=>"2010-06-16 10:02:53 UTC",
   :expiry_date=>"2010-07-15 10:02:53 UTC",
   :field_partner_name=>"Sakhi Samudhaya Kosh",
   :social_impact=>"HIGH",
   :social_impact_story=>"She started this business around four years back, with a loan from SHG and landed up paying a very high interest rate of almost 24%, which cut into her profits. This experience has made her reluctant to borrow the 10,000 rupees she now needs for expansion of her small venture. Adding new products to her range, and finding new customers in nearby villages will increase her net income to over 2500 rupees (~ S$75) a month, which she hopes will be saved for a rainy day. The Milaap initiative seeks to get her the entire amount of the loan.")


LoanRepayment.create(:loan_id=>2,:repayment_date=>"2010-08-23 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>2,:repayment_date=>"2010-09-24 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>2,:repayment_date=>"2010-10-24 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>2,:repayment_date=>"2010-11-23 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>2,:repayment_date=>"2010-12-23 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>2,:repayment_date=>"2011-01-23 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>2,:repayment_date=>"2011-02-23 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>2,:repayment_date=>"2011-03-25 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>2,:repayment_date=>"2011-04-24 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>2,:repayment_date=>"2011-05-24 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>2,:repayment_date=>"2011-06-23 10:02:53 UTC",:amount=>935)





Borrower.create(:name=>"Shanta Shalmal Shinde",
 :gender=>"female",
 :photo=>"1.Shanta Shinde.JPG",
 :village=>"Kemwadi",
 :taluka=>"Tuljapur",
 :district=>"Osmanabad",
 :state=>"Maharashtra",
 :loan_id=>3,
 :borrower_group_id=>3,
 :field_partner_id=>1,
 :borrower_story=>"Shanta Shinde, from the Kemwadi village near Osmanabad, makes about 1000 rupees (~ S$30) a month, by selling Oorja smokeless cookstoves and HLL Pureit water purifier, among other things.  She's been with Sakhi community for four years now. She started primarily with money from her savings, and the profits have helped her buy a few amenities for her house. By putting in 25 hours of work each week, she manages to contribute to the income of her family which primarily comes from farming",
 :community_id=>1,
 :poverty_level=>0.35,
 :impact_story_image=>"shantashinde.PNG"
  )


BorrowerGroup.create(:id=>3,:loan_id=>3,:field_partner_id=>1)



Loan.create(:id=>3,
   :title => 'Provide clean drinking water',
   :category_id =>5,
   :amount=>15000,
   :amount_remaining=>0,
   :terms=>12,
   :repayment_cycle=>"monthly",
   :loan_status=>"Repaying",
   :interest_rate=>0.12,
   :date_of_disbursement_of_loan=>"2010-07-24 10:02:53 UTC",
   :date_of_final_payment=>"2011-07-23 10:02:53 UTC",
   :date_listed=>"2010-06-16 10:02:53 UTC",
   :expiry_date=>"2010-07-15 10:02:53 UTC",
   :field_partner_name=>"Sakhi Samudhaya Kosh",
   :social_impact=>"LOW",
   :social_impact_story=>"She now needs 15,000 rupees more to be able to add new products to her range, and to invest in infrastructure for the business. This will increase her net monthly income to over 5000 rupees (~ S$150). But it's not as easy to take a loan for her segment. Many people in her community have taken loans from the bank, and listening to their experiences of paying back the high interest make her reluctant to get another one for expansion of her small retailing business. The Milaap initiative seeks to get her the entire amount of the loan, the additional income from which, needless to say, will be saved for the higher education of her two children")


LoanRepayment.create(:loan_id=>3,:repayment_date=>"2010-08-23 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>3,:repayment_date=>"2010-09-24 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>3,:repayment_date=>"2010-10-24 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>3,:repayment_date=>"2010-11-23 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>3,:repayment_date=>"2010-12-23 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>3,:repayment_date=>"2011-01-23 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>3,:repayment_date=>"2011-02-23 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>3,:repayment_date=>"2011-03-25 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>3,:repayment_date=>"2011-04-24 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>3,:repayment_date=>"2011-05-24 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>3,:repayment_date=>"2011-06-23 10:02:53 UTC",:amount=>1403)





Borrower.create(:name=>"Shaila Patil",
 :gender=>"female",
 :photo=>"3.Shaila Patil.jpg",
 :village=>"Paranda",
 :taluka=>"Paranda",
 :district=>"Osmanabad",
 :state=>"Maharashtra",
 :loan_id=>4,
 :borrower_group_id=>4,
 :field_partner_id=>1,
 :borrower_story=>"Shaila lives in the Paranda village near Osmanabad in Maharashtra, India. She lives with her two children and her husband, who's working with a private employer. She has studied up to secondary school. She's been with Sakhi retail for 4 years now, working more than 25 hours a week to sell BP Oorja smokeless cookstoves and the related Oorja Pellets. She places an order for the products once or twice a month, usually of the value of 10 thousand rupees or more. She adds about 1000 Rupees a month to the family income through her venture.",
 :community_id=>5,
 :poverty_level=>0.25,
 :impact_story_image=>"shailapatil.PNG"
)


BorrowerGroup.create(:id=>4,:loan_id=>4,:field_partner_id=>1)



Loan.create(:id=>4,
   :title => 'Retail smokeless cook stoves',
   :category_id =>5,
   :amount=>15000,
   :amount_remaining=>0,
   :terms=>12,
   :repayment_cycle=>"monthly",
   :loan_status=>"Repaying",
   :interest_rate=>0.12,
   :date_of_disbursement_of_loan=>"2010-07-24 10:02:53 UTC",
   :date_of_final_payment=>"2011-07-23 10:02:53 UTC",
   :date_listed=>"2010-06-16 10:02:53 UTC",
   :expiry_date=>"2010-07-15 10:02:53 UTC",
   :field_partner_name=>"Sakhi Samudhaya Kosh",
   :social_impact=>"LOW",
   :social_impact_story=>"While the original investment was through a part of the family savings; to expand her business, she will need a loan of 15,000 rupees. This will help her add new products to her retail portfolio, as well as invest in infrastructure, like better storage. This expansion of business, she hopes, will give her an additional income of 5000 rupees (~S$150) a month, giving her enough to build a savings for old age")


LoanRepayment.create(:loan_id=>4,:repayment_date=>"2010-08-23 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>4,:repayment_date=>"2010-09-24 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>4,:repayment_date=>"2010-10-24 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>4,:repayment_date=>"2010-11-23 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>4,:repayment_date=>"2010-12-23 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>4,:repayment_date=>"2011-01-23 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>4,:repayment_date=>"2011-02-23 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>4,:repayment_date=>"2011-03-25 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>4,:repayment_date=>"2011-04-24 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>4,:repayment_date=>"2011-05-24 10:02:53 UTC",:amount=>1403)
LoanRepayment.create(:loan_id=>4,:repayment_date=>"2011-06-23 10:02:53 UTC",:amount=>1403)




Borrower.create(:name=>"Kavita Lohiya",
 :gender=>"female",
 :photo=>"9.KavitaLohiya.jpg",
 :village=>"Murum",
 :taluka=>"Murum",
 :district=>"Osmanabad",
 :state=>"Maharashtra",
 :loan_id=>5,
 :borrower_group_id=>5,
 :field_partner_id=>1,
 :borrower_story=>"Kavita Ramesh Lohiya, from the Murum village in the Osmanabad district, is currently retailing only the Oorja and the related Oorja pellets. Though her portfolio is small, she puts around 15 hours a week towards this. She places two orders each month of roughly 10000 rupees each, and through her hard work, makes almost 2000 Rupees a month. She has studied unto the 10th grade, and her husband, the breadwinner of the family, is a farmer. Her two children are still in school.",
 :community_id=>3,
 :poverty_level=>0.65,
 :impact_story_image=>"lohiya.PNG"
 )


BorrowerGroup.create(:id=>5,:loan_id=>5,:field_partner_id=>1)



Loan.create(:id=>5,
   :title => 'Supply biomass fuel for cooking',
   :category_id =>5,
   :amount=>10000,
   :amount_remaining=>0,
   :terms=>12,
   :repayment_cycle=>"monthly",
   :loan_status=>"Repaying",
   :interest_rate=>0.12,
   :date_of_disbursement_of_loan=>"2010-07-24 10:02:53 UTC",
   :date_of_final_payment=>"2011-07-23 10:02:53 UTC",
   :date_listed=>"2010-06-16 10:02:53 UTC",
   :expiry_date=>"2010-07-15 10:02:53 UTC",
   :field_partner_name=>"Sakhi Samudhaya Kosh",
   :social_impact=>"HIGH",
   :social_impact_story=>"After four years of working with sakhi retail, she thinks she's ready to expand her business by adding new products to her range. Given her experience, she thinks she'll gain 5000 rupees a month from this expansion using a loan of 10,000 rupees. Right now her aim is to save all the money she makes")


LoanRepayment.create(:loan_id=>5,:repayment_date=>"2010-08-23 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>5,:repayment_date=>"2010-09-24 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>5,:repayment_date=>"2010-10-24 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>5,:repayment_date=>"2010-11-23 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>5,:repayment_date=>"2010-12-23 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>5,:repayment_date=>"2011-01-23 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>5,:repayment_date=>"2011-02-23 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>5,:repayment_date=>"2011-03-25 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>5,:repayment_date=>"2011-04-24 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>5,:repayment_date=>"2011-05-24 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>5,:repayment_date=>"2011-06-23 10:02:53 UTC",:amount=>935)



Borrower.create(:name=>"Manisha Dhere",
 :gender=>"female",
 :photo=>"6.manisha_dhere.jpg",
 :village=>"Pangaon",
 :taluka=>"Barshi",
 :district=>"Solapur",
 :state=>"Maharashtra",
 :loan_id=>6,
 :borrower_group_id=>6,
 :field_partner_id=>1,
 :borrower_story=>"Manisha lives with her husband Harichandra (30) and mother in law (65). Her husband earns the livelihood through farming. Her mother in law stays at home. Family's financials: INR 36000 p.a. Credit History: No prior loan.",
 :community_id=>4,
 :poverty_level=>0
 )


BorrowerGroup.create(:id=>6,:loan_id=>6,:field_partner_id=>1)



Loan.create(:id=>6,
   :title => 'Construction of toilet',
   :category_id =>2,
   :amount=>20000,
   :amount_remaining=>0,
   :terms =>12,
   :loan_status=>"Not Funded",
   :date_listed=>"2010-09-25 10:02:53 UTC",
   :expiry_date=>"2010-10-25 10:02:53 UTC",
   :field_partner_name=>"Sakhi Samudhaya Kosh",
   :social_impact_story=>"Due to meagre family income, Manisha and her husband use the money very cautiously. In the process they deny themselves a lot of basic requirements and don't have access to basic sanitation facilities.Constructing a toilet through one time payment isn't very feasible for them as it will cause an imbalance in thier household expenditure. With the loan the family will get a toilet constructed and repay the money on a monthly basis.")



LoanRepayment.create(:loan_id=>6,:repayment_date=>"2010-10-25 10:02:53 UTC",:amount=>1667)
LoanRepayment.create(:loan_id=>6,:repayment_date=>"2010-11-25 10:02:53 UTC",:amount=>1667)
LoanRepayment.create(:loan_id=>6,:repayment_date=>"2010-12-25 10:02:53 UTC",:amount=>1667)
LoanRepayment.create(:loan_id=>6,:repayment_date=>"2011-01-25 10:02:53 UTC",:amount=>1667)
LoanRepayment.create(:loan_id=>6,:repayment_date=>"2011-02-25 10:02:53 UTC",:amount=>1667)
LoanRepayment.create(:loan_id=>6,:repayment_date=>"2011-03-25 10:02:53 UTC",:amount=>1667)
LoanRepayment.create(:loan_id=>6,:repayment_date=>"2011-04-25 10:02:53 UTC",:amount=>1667)
LoanRepayment.create(:loan_id=>6,:repayment_date=>"2011-05-25 10:02:53 UTC",:amount=>1667)
LoanRepayment.create(:loan_id=>6,:repayment_date=>"2011-06-25 10:02:53 UTC",:amount=>1667)
LoanRepayment.create(:loan_id=>6,:repayment_date=>"2011-07-25 10:02:53 UTC",:amount=>1667)
LoanRepayment.create(:loan_id=>6,:repayment_date=>"2011-08-25 10:02:53 UTC",:amount=>1667)
LoanRepayment.create(:loan_id=>6,:repayment_date=>"2011-09-25 10:02:53 UTC",:amount=>1667)









Borrower.create(:name=>"Shobha Gaikwad",
 :gender=>"female",
 :photo=>"7.Shobha_Gaikwad.jpg",
 :village=>"Saundere",
 :taluka=>"Barshi",
 :district=>"Solapur",
 :state=>"Maharashtra",
 :loan_id=>7,
 :borrower_group_id=>7,
 :field_partner_id=>1,
 :borrower_story=>"Shobha supports the family along with her husband through farming and working as a labourer. She has two sons aged 16 and 13. Family's financials: INR 98000. Credit History: No prior loan",
 :community_id=>4,
 :poverty_level=>0
 )


BorrowerGroup.create(:id=>7,:loan_id=>7,:field_partner_id=>1)



Loan.create(:id=>7,
   :title => 'Construction of toilet',
   :category_id =>2,
   :amount=>10000,
   :amount_remaining=>0,
   :loan_status=>"Not Funded",
   :date_listed=>"2010-09-25 10:02:53 UTC",
   :expiry_date=>"2010-10-25 10:02:53 UTC",
   :field_partner_name=>"Sakhi Samudhaya Kosh",
   :social_impact_story=>"Shobha and her family have been living in a small village of Saundere. Saundere has bad sanitation facilities and Shobha's family has suffered many diseases because of this. Now the family wants to get a toilet constructed to avoid any further ailments and requires the loan amount.")




LoanRepayment.create(:loan_id=>7,:repayment_date=>"2010-10-25 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>7,:repayment_date=>"2010-11-25 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>7,:repayment_date=>"2010-12-25 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>7,:repayment_date=>"2011-01-25 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>7,:repayment_date=>"2011-02-25 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>7,:repayment_date=>"2011-03-25 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>7,:repayment_date=>"2011-04-25 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>7,:repayment_date=>"2011-05-25 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>7,:repayment_date=>"2011-06-25 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>7,:repayment_date=>"2011-07-25 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>7,:repayment_date=>"2011-08-25 10:02:53 UTC",:amount=>935)
LoanRepayment.create(:loan_id=>7,:repayment_date=>"2011-09-25 10:02:53 UTC",:amount=>935)








Borrower.create(:name=>"Suvarna Navnath Kale",
 :gender=>"female",
 :photo=>"8.sudhir_kale.jpg",
 :name_of_student=>"Sudhir Navnath Kale",
 :relationship_with_applicant=>"son",
 :village=>"Pangaon",
 :taluka=>"Barshi",
 :district=>"Solapur",
 :state=>"Maharashtra",
 :loan_id=>8,
 :borrower_group_id=>8,
 :field_partner_id=>1,
 :borrower_story=>"Suvarna Kale is married to Navnath Kale (55) who holds a diploma and works as a serviceman. They have three sons aged 25, 23 and 20. All are studying. The eldest son has done his automobile engineering and is working with a small firm. The two younger sons are pursuing a course in English. One is doing his masters the other one is in his undergraduation. The father had supported his eldest sons education through his salary. The eldest sons now supports the household expenditure and the education of his two brothers. The middle son who has just completed his masters and had been partially supporting the family financially, now wants to pursue his MBA. Family's Financials: Navnath Kale earns about INR 120000 p.a, Sudhakar Navnath (25) earns about INR 120000 p.a and Suhas (23) earns INR 24000 p.a. Credit History: No prior loan.",
 :community_id=>4,
 :poverty_level=>0
 )


BorrowerGroup.create(:id=>8,:loan_id=>8,:field_partner_id=>1)



Loan.create(:id=>8,
   :title => 'Continue higher education',
   :category_id =>3,
   :amount=>20000,
   :amount_remaining=>0,
   :terms=>18,
   :loan_status=>"Not Funded",
   :date_of_disbursement_of_loan=>"2010-09-02 10:02:53 UTC",
   :date_of_final_payment=>"2011-03-04 10:02:53 UTC",
   :date_listed=>"2010-09-25 10:02:53 UTC",
   :expiry_date=>"2010-10-25 10:02:53 UTC",
   :field_partner_name=>"Sakhi Samudhaya Kosh",
   :social_impact_story=>"The family wants to opt for an education loan instead of spending from thier monthly cash flows. This option will give them the flexibility of not losing out on a big amount in one go, instead a stipulated monthly repayment and the freedom to allow thier youngest son to continue his studies uninterrupted.")



LoanRepayment.create(:loan_id=>8,:repayment_date=>"2010-10-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2010-11-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2010-12-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2011-01-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2011-02-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2011-03-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2011-04-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2011-05-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2011-06-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2011-07-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2011-08-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2011-09-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2011-10-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2011-11-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2011-12-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2012-01-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2012-02-25 10:02:53 UTC",:amount=>1112)
LoanRepayment.create(:loan_id=>8,:repayment_date=>"2012-03-25 10:02:53 UTC",:amount=>1112)









Borrower.create(:name=>"Surekha More",
 :gender=>"female",
 :photo=>"9.surekha_dattatraya_more.jpg",
 :name_of_student=>"Vishal Dattaraya More",
 :relationship_with_applicant=>"son",
 :village=>"Takehigharga",
 :taluka=>"Barshi",
 :district=>"Solapur",
 :state=>"Maharashtra",
 :loan_id=>9,
 :borrower_group_id=>9,
 :field_partner_id=>1,
 :borrower_story=>"Surekha is a homemaker, taking care of her daughter Smita (25) , son Vishal (21) and husband Dattatrey Shayamrao More. Dattatrey is a graduate working with an private organisation. He is the bread winner of the family and has been supporting the household and his daugthers' education. Thier eldest daughter is B. Ed and looking for a job. Younger daughter is still pursuing her education and is 21 years of age. Family's financial: Dattatrey earns about INR 2,16000 p.a.. prospective source of income: Smita's salary are a teacher Credit History: No prior Loan",
 :community_id=>4,
 :poverty_level=>0
 )


BorrowerGroup.create(:id=>9,:loan_id=>9,:field_partner_id=>1)



Loan.create(:id=>9,
   :title => 'Sustain the education of their son',
   :category_id =>3,
   :amount=>24000,
   :terms=>18,
   :amount_remaining=>0,
   :loan_status=>"Not Funded",
   :date_of_disbursement_of_loan=>"2010-07-15 10:02:53 UTC",
   :date_of_final_payment=>"2012-02-11 10:02:53 UTC",
   :date_listed=>"2010-09-25 10:02:53 UTC",
   :expiry_date=>"2010-10-25 10:02:53 UTC",
   :field_partner_name=>"Sakhi Samudhaya Kosh",
   :social_impact_story=>"Surekha More and her husband have been of progressive thinking and believed in educating their son and daugther. With limited resources, they not only paid for their daughter's and son's education but also ran the household conservatively. However with a big amount of money spent on thier elder daughter, Smita's B.Ed, the financial strain is more evident than ever now. Also due to delay in Smita's recruitmentas a teacher, there is no added source of income for the existing expenditure and younger son's education. Hence Surekha wants to take a loan to sustain the youngest son's higher education till Smita starts earning. Dattatrey and his daughter Smita will be taking care of the monthly repayments of the loans.")



LoanRepayment.create(:loan_id=>9,:repayment_date=>"2010-10-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2010-11-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2010-12-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2011-01-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2011-02-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2011-03-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2011-04-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2011-05-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2011-06-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2011-07-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2011-08-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2011-09-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2011-10-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2011-11-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2011-12-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2012-01-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2012-02-25 10:02:53 UTC",:amount=>1334)
LoanRepayment.create(:loan_id=>9,:repayment_date=>"2012-03-25 10:02:53 UTC",:amount=>1334)





Borrower.create(:name=>"Minakshi Anant Munde",
 :gender=>"female",
 :photo=>"10_minakshi_anant_munde.jpg",
 :name_of_student=>"Priyanka Munde",
 :relationship_with_applicant=>"daughter",
 :village=>"Barshi",
 :taluka=>"Barshi",
 :district=>"Solapur",
 :state=>"Maharashtra",
 :loan_id=>10,
 :borrower_group_id=>10,
 :field_partner_id=>1,
 :borrower_story=>"Meenakshi Munde is a home maker, taking care of her husband, Anant Munde and one son (standard 12th) and one daughter (standard 11th). Meenakshi herself has studied only till 7th standard. Her husband holds a degree in master of commerce, is working with a factory and also has a farmland. Money from his occupation in the factory and farm takes care of the household and thier children's education. Family's Financials: 1) Anant Munde's income from services at the factory, INR 108000 p.a and from farming an additional INR 60000 p.a. Credit History: No prior Loan",
 :community_id=>4,
 :poverty_level=>0
 )

BorrowerGroup.create(:id=>10,:loan_id=>10,:field_partner_id=>1)

Loan.create(:id=>10,
   :title => 'Sustain education of their daugther',
   :category_id =>3,
   :amount=>15000,
   :terms=>15,
   :amount_remaining=>0,
   :loan_status=>"Not Funded",
   :date_of_disbursement_of_loan=>"2010-08-23 10:02:53 UTC",
   :date_of_final_payment=>"2012-11-26 10:02:53 UTC",
   :date_listed=>"2010-09-25 10:02:53 UTC",
   :expiry_date=>"2010-10-25 10:02:53 UTC",
   :field_partner_name=>"Sakhi Samudhaya Kosh",
   :social_impact_story=>"Meenakshi Munde could continue her education only till the 7th Standard. The family has ensured that both the children get their school education. However, their son now needs to go to college and their daughter's education might be compromised. Meenakshi Munde doesn't want such a situation to arise and hence to let her daughter continue with her education as well, needs a loan.")




LoanRepayment.create(:loan_id=>10,:repayment_date=>"2010-10-25 10:02:53 UTC",:amount=>1000)
LoanRepayment.create(:loan_id=>10,:repayment_date=>"2010-11-25 10:02:53 UTC",:amount=>1000)
LoanRepayment.create(:loan_id=>10,:repayment_date=>"2010-12-25 10:02:53 UTC",:amount=>1000)
LoanRepayment.create(:loan_id=>10,:repayment_date=>"2011-01-25 10:02:53 UTC",:amount=>1000)
LoanRepayment.create(:loan_id=>10,:repayment_date=>"2011-02-25 10:02:53 UTC",:amount=>1000)
LoanRepayment.create(:loan_id=>10,:repayment_date=>"2011-03-25 10:02:53 UTC",:amount=>1000)
LoanRepayment.create(:loan_id=>10,:repayment_date=>"2011-04-25 10:02:53 UTC",:amount=>1000)
LoanRepayment.create(:loan_id=>10,:repayment_date=>"2011-05-25 10:02:53 UTC",:amount=>1000)
LoanRepayment.create(:loan_id=>10,:repayment_date=>"2011-06-25 10:02:53 UTC",:amount=>1000)
LoanRepayment.create(:loan_id=>10,:repayment_date=>"2011-07-25 10:02:53 UTC",:amount=>1000)
LoanRepayment.create(:loan_id=>10,:repayment_date=>"2011-08-25 10:02:53 UTC",:amount=>1000)
LoanRepayment.create(:loan_id=>10,:repayment_date=>"2011-09-25 10:02:53 UTC",:amount=>1000)
LoanRepayment.create(:loan_id=>10,:repayment_date=>"2011-10-25 10:02:53 UTC",:amount=>1000)
LoanRepayment.create(:loan_id=>10,:repayment_date=>"2011-11-25 10:02:53 UTC",:amount=>1000)
LoanRepayment.create(:loan_id=>10,:repayment_date=>"2011-12-25 10:02:53 UTC",:amount=>1000)


Community.create(:community_id=>1,:name=>"Tuljapur",:info=>'Tuljapur, home to the famous Tulja Bhavani temple, is the second largest taluka in Osmanabad with over 47,000 households in 123 villages, with 80% of them still living in the countryside. One-fifth of them fall below the poverty line. Dalits and Tribals (socio-economic backward classes) constitute one-fourth of the community.
<ul class="bullet"><li>70% of households live in permanent housing structures</li></ul>
<ul class="bullet"><li>Only 53% of the women are literate.</li></ul>
<ul class="bullet"><li>Over 26000 households still dont have access to electricity.</li></ul>
<ul class="bullet"><li>65% of the population travel a minimum of 5 kms to access the nearest primary health center.</li></ul>')

Community.create(:community_id=>2,:name=>"Malshiras",:info=>'With over 80,000 households in 117 villages, Malshiras is one of the largest talukas in Solapur district and is completely rural. 44% of the population fall below the poverty line. Dalits and Tribals (socio-economic backward classes) constitute nearly one-fifth of the  community.
<ul class="bullet"><li>55% of households live in semi-permanent and temporary housing structures.</li></ul>
<ul class="bullet"><li>Only 60% of the women are literate.</li></ul>
<ul class="bullet"><li>Over 35000 households still dont have access to electricity.</li></ul>
<ul class="bullet"><li>72% of the population travel a minimum of 5 kms to access the nearest primary health center.</li></ul>')




Community.create(:community_id=>3,:name=>"Murum",:info=>"Murum taluka in Osmanabad district is predominantly rural (in nature) with over 85% of the population spread across its 88 villages. Nearly one-half of the 21,000 households in the taluka live below the poverty line. Dalits and Tribals (socio-economic backward classes) constitute one-sixth of the community. 47% of households live in semi-permanent and temporary housing structures Only 52% of the women are literate.Over 9000 households still don't have access to electricity.80% of the population travel a minimum of 5 kms to access the nearest primary health center.")


Community.create(:community_id=>4,:name=>"South Solapur",:info=>'Spread across 91 villages, South Solapur, lies completely in the rural hinterland with nearly 40,000 households. One-third of the population live below the poverty line. Dalits and Tribals (socio-economic backward classes) constitute one-fifth of the community.
<ul class="bullet"><li>58% of households live in semi-permanent and temporary housing structures.</li></ul>
<ul class="bullet"><li>Only 55% of the women are literate.</li></ul>
<ul class="bullet"><li>Nearly 20,000 households still dont have access to electricity.</li></ul>
<ul class="bullet"><li>Over 80% of the population travel a minimum of 5 kms to access the nearest primary health center.</li></ul>')



Community.create(:community_id=>5,:name=>"Paranda",:info=>'Spread across 96 villages, Paranda, is the oldest taluka in Osmanabad with over 31,000 households, 86% being rural. 42% of the population falls below the poverty line. Dalits and Tribals (socio-economic backward classes) constitute nearly one-eighth of the community.
<ul class="bullet"><li>52% of households live in semi-permanent and temporary housing structures</li></ul>
<ul class="bullet"><li>Only 51% of the women are literate.</li></ul>
<ul class="bullet"><li>Nearly 18000 households still dont have access to electricity.</li></ul>
<ul class="bullet"><li>Nearly 60% of the population travel a minimum of 5 kms to access the nearest primary health center.</li></ul>')

MilaapBalance.create(:balance_id=>1,:balance=>0)






























