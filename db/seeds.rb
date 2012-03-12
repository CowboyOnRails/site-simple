#encoding: utf-8
if Rails.env.development? || Rails.env.staging?
  Rake::Task["db:reset"].invoke
end 

Location.create(:adress => "Наш адрес",:phone1 => '311-11-11', :phone2 => '311-11-22',
     :email => 'pop-corm2@ya.ru',:copyright => 'copyright',:sitename => 'Сайт Simple')

Article.create(:name => "Главная", :slug => "page-home", :home => true)

articles = [
	["Страница 1","page-1"],
	["Страница 2","page-2"],
	["Страница 3","page-3"],
	["Страница 4","page-4"],
]
articles.each do |article|
	Article.create!(:name => article[0], :slug => article[1], :home => false, :top => true)
end