User.create!( :login => 'admin', :fullname => 'Administrator',
             :password => 'admin', :password_confirmation => 'admin',
             :email => 'admin@inexsda.cz' )

Language.create!(:code => 'gb', :name => 'english')
Language.create!(:code => 'cz', :name => 'czech')
Language.create!(:code => 'it', :name => 'italian')
Language.create!(:code => 'hu', :name => 'hungarian')
Language.create!(:code => 'at', :name => 'german')

Article.create!( :title => 'Project', :key => 'project', :path => 'about-us')
Article.create!( :title => 'African Partners', :key => 'african-partners', :path => 'about-us')
Article.create!( :title => 'European Partners', :key => 'european-partners', :path => 'about-us')
Article.create!( :title => 'Development FAQ', :key => 'development-faq', :path => 'documents')
Article.create!( :title => 'Join us - schools', :key => 'join-us-schools', :path => 'play-with-us')
Article.create!( :title => 'Join us - students', :key => 'join-us-students', :path => 'play-with-us')

MenuIconsObserver.draw_icon('News', 'news')
MenuIconsObserver.draw_icon('Photos', 'photos')
MenuIconsObserver.draw_icon('Videos', 'videos')
MenuIconsObserver.draw_icon('Calendar', 'calendar')
MenuIconsObserver.draw_icon('Organizers', 'organizers')

DocumentType.create!(:name => 'General', :icon => File.new("#{RAILS_ROOT}/db/document_types/general.gif"))
DocumentType.create!(:name => 'Manual', :icon => File.new("#{RAILS_ROOT}/db/document_types/draft.gif"))
DocumentType.create!(:name => 'Media', :icon => File.new("#{RAILS_ROOT}/db/document_types/media.gif"))

NewsType.create!(:name => 'Hot News', :icon => File.new("#{RAILS_ROOT}/db/news_types/aktuality.gif"))
NewsType.create!(:name => 'Cooperation', :icon => File.new("#{RAILS_ROOT}/db/news_types/spoluprace.gif"))
NewsType.create!(:name => 'Tournament', :icon => File.new("#{RAILS_ROOT}/db/news_types/cup.gif"))
NewsType.create!(:name => 'Evaluation', :icon => File.new("#{RAILS_ROOT}/db/news_types/evaluace.gif"))
NewsType.create!(:name => 'FIFA World Cup 2010', :icon => File.new("#{RAILS_ROOT}/db/news_types/fifa2010.gif"))
NewsType.create!(:name => 'Photos & Videos', :icon => File.new("#{RAILS_ROOT}/db/news_types/fotoreporty.gif"))
NewsType.create!(:name => 'Conference', :icon => File.new("#{RAILS_ROOT}/db/news_types/konference.gif"))
NewsType.create!(:name => 'Media Related', :icon => File.new("#{RAILS_ROOT}/db/news_types/media.gif"))
NewsType.create!(:name => 'African Partners', :icon => File.new("#{RAILS_ROOT}/db/news_types/mysa-team.gif"))
NewsType.create!(:name => 'Negative News', :icon => File.new("#{RAILS_ROOT}/db/news_types/negativni-zpravy.gif"))
NewsType.create!(:name => 'General', :icon => File.new("#{RAILS_ROOT}/db/news_types/nezarazene.gif"))
NewsType.create!(:name => 'Announcement', :icon => File.new("#{RAILS_ROOT}/db/news_types/oznameni.gif"))                     


Profile.create!(:name => "INEX-Association for Voluntary Activities",
               :homepage => "http://www.inexsda.cz",
               :contact_person => "Pavel Žwak",
               :contact_email => 'fotbal@inexsda.cz',
               :phone => ' +420 222 362 715',
               :logo => File.new("#{RAILS_ROOT}/db/logos/inex.png"),
               :address => 'Varšavská 30, 120 00 Praha 2 (Czech Republic)',
               :description => "<p>INEX - Association for Voluntary Activities - is a non-governmental non-profit organisation founded in 1991 whose primary activities are in the area of international voluntary work. Our main objective is, through international voluntary work, to enable people to help where their help is most needed and at the same time make it beneficial for volunteers in terms of obtaining new life and work experiences which they can use later in their careers. </p>

<p>Sport is a universal way of communication all around the world. This is exactly the reason why it is so often used as a tool for solving various problems in terms of development cooperation. Sport is also a unique tool for raising awareness about development issues and living conditions in the „Southern“ countries among the wider public. In combination with development cooperation football has a huge impact on individuals‘ lives. Football has one unique feature – its fun and this attracts the attention of people from very diverse social groups, even those we would never think about.</p>

<p>INEX – Association for Voluntary Activities has been using football as a tool for development cooperation since 2005. Every year a group of young football players, originally from slums,  is brought by our our partner organization MYSA (Mathare Youth Sport Associaton) to our country where they take part in the reach sport, cultural and educational program. 12 highshools from 4 different regions are actively involved in this programme – intercultural semminars, football tournaments, music concerts, hosting Kenyan players in their families and also organizing trips. Using the popularity of football, famous people (Tomáš Ujfaluši is a patron), our strong partnership with the Czech football union,Czech football clubs (FK SIAD Most, Bohemians 1905, SK Sigma Olomouc) and other NGDOs (ARPOK, Pontopolis, Humanitas Africa) as well as companies from the commercial sphere (Siemens, EUROrscg) , INEX-SDA is raisng awareness within Czech society. The whole program is, in the long term,  financed by the Ministry of Foreign Affairs as an official part of Czech international development cooperation and is a stable part of the biggest development campaign in the Czech Republic „Česko proti chudobě“.</p>")

Profile.create!(:name => "VIDC – Vienna Institute for International Dialogue and Cooperation",
               :homepage => 'http://www.vidc.org, http://www.kenako.at',
               :contact_person  => 'Bella Bello Bitugu, Kurt Wachter',
               :contact_email  => 'bitugu@vidc.org, wachter@vidc.org',
               :logo => File.new("#{RAILS_ROOT}/db/logos/vidc.png"),
               :phone => '0043 650 6831842 (Bella Bello Bitugu), 0043 1 7133594-90 (Kurt Wachter)',
               :address => "Möllwaldplatz 5/3, A-1040 Vienna, Austria",
               :description => "<p>The VIDC , founded in 1962, is a non-profit, international non-governmental organisation (NGO) active in the fields of international dialogue and cooperation, awareness-raising on development issues, culture and public relations and anti-racism and anti-discrimination. VIDC has three departments: Dialogue and Policies (development cooperation), Moving Cultures (cultural exchange) and FairPlay. Different Colours. One Game (anti-discrimination in European football.</p>
 
<p>With its sociopolitical interventions and its orientation towards grassroots VIDC wants to make attitudes, values and ways of living in their global context visible and the variety of realities as an expression of the cultural wealth understandable. As a consequence VIDC sees its place in the working fields of science and culture as well as in the world of sports as an emancipatory contribution for showing solidarity against all forms of discrimination and racism in society. On this note vidc tries to create! awareness among the Austrian public with its work. The goal is to change the living conditions for marginalized and excluded people and to support their self-organisation.</p>")

Profile.create!(:name => "UISP - Unione Italiana Sport per Tutti (Italian Union of Sportforall)",
               :homepage => 'http://www.uisp.it',
               :contact_person => 'Layla Mousa',
               :contact_email => 'l.mousa@uisp.it',
               :phone => '00390643984326',
               :logo => File.new("#{RAILS_ROOT}/db/logos/uisp.png"),
               :address => 'Largo Nino Franchellucci 73 - 00155 - Rome (Italy)',
               :description => "<p>The Uisp (Unione Italiana Sport Per tutti) is an association of sport for all with the aim to extend the right to practice sport to everyone. Sport for all is a good connected with the health, life quality, education and social relations. This is why it deserves the aknowledgment and public tutelacy.</p>

<p>Sport for all is a right, an immediate reference to a good life quality to be strengthened day after day both in the traditional frameworks and in the environment. Sport for all interprets a new right of citizenship, it belongs to the \"life policies\" and, also by having experience with a number of competitive activities, it is justifyied thanks to the values, which are not referable to the supremacy of the result, which is typical of the absolute performance sport. The only one difference which we fight against are social inequalities and lack of equal opportunities.</p>

<p>Sport for all means right this: rewrite our sport purpose, redesign the activity of every teaching \"made to your measure\", following the profile of everyone, always remembering the profile of UISP: the culture of rights, of the environment, of solidarity.</p>

<p>The great Uisp sport for all initiatives are launch in spring since the beginning of the '80s: Vivicittà , Giocagin, Bicincittà , Sport in the Squares. These are sports event that involve tens of Italian and foreign cities at the same time and that see Uisp together with important Italian associations, from Unicef to WWF, from Legambiente to Libera (the association againt mafia), from Aism (the association for the sclerosys research) to Amnesty International. Uisp is also part of international network and partnership as FARE (Football Against Racism in Europe) and ISCA (International Sport and Culture Association).</p>

<p>Uisp tries to deepen and to show the several faces of \"sport for all\" and its \"social value\".</p>

<p>The topic of the solidarity, declined on the field of inclusion and socialization, it becomes the nerve of one of the several projects that Uisp realizes on the land of the denied rights. As in the case of the immigration projects. The main aim is to succeed to an awarness of public opinion and to a pacific cohabitation between different cultures peoples through sport like socialization instrument.</p>
 Troughout its Ngo, called Peace Games, Uisp i salso active in Cooperation for Development field, to spread the use of sport as educational and development instrument, to reduce social discomfort and bad effects of conflicts.")



Profile.create!( :name =>  'Mahatma Ghandi Human Rights Organisation',
                :homepage => 'http://www.gandhi.ini.hu',
                :contact_person => 'Gibriel Deen',
                :contact_email => 'gandhiegyesulet@gmail.com',
                :phone => '0036 1 215 83 01,',
                :logo => File.new("#{RAILS_ROOT}/db/logos/gandhi.png"),
                :address => 'H-1092 Budapest, Ferenc Krt. 18',
                :description => "The Romans are a minority group and a big task in Hungary is integrating them into the larger community so we decided to use football which is a powerful tool for integration. The Romans constitute 18 - 20 percent of the hungarian community. The Romans in Budapest are concentrated in the 8th District region of the city so we started the program there. Currently we have 4 Roman schools participating in the program and we are planning to get more schools involved. We have a coach dedicated to the program and hold training sessions for the school kids. Our ultimate goal is to help them to be integrated in to Hungarian society and keep them away from crimes. Find attached some pictures about the program.")


# just for testing
3.times do |i|
 Headline.create!(:title => 'Come and Play!', :short => 'Short, 5 seconds match in Budapest.', :long => 'Long story...', :news_type => NewsType.all[i])
 Document.create!(:name => 'Manual', :document_type => DocumentType.all[i], :language => Language.all[i], :file => File.new("#{RAILS_ROOT}/db/logos/gandhi.png"))
end
