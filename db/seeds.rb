# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# tags = Tag.create([
#   { name: 'Doktor' },
#   { name: 'Hemşire' },
# 	{ name: 'İnternet Sitesi' }, 
# 	{ name: 'Web Tasarımı' },
# 	{ name: 'Türkçe Dersi' },
# 	{ name: 'Direksiyon Dersi'},
# 	{ name: 'Mobil Uygulama Geliştirme' },
# 	{ name: 'İngilizce Dersi' },
# 	{ name: 'TOEFL özel ders' },
# 	{ name: 'YGSMatematik' },
# 	{ name: 'Tamir' },
# 	{ name: 'Fotoğrafçılık' },
# 	{ name: 'Ebru' },
# 	{ name: 'Karakalem Resim Dersi' },
# 	{ name: 'Gitardersi' },
# 	{ name: 'Kodlama' },
# 	{ name: 'Piyano' },
# 	{ name: 'Tadilat' },
# 	{ name: 'Mobilya' },
# 	{ name: 'Organizasyon' },
# 	{ name: 'Özel ders' },
# 	{ name: 'Temizlik' },
# 	{ name: 'Wing Tsun'},
# 	{ name: 'Wing Chun'},
# 	{ name: 'Mantolama'},
# 	{ name: 'İç mimar'},
# 	{ name: 'Bebek bakımı'},
# 	{ name: 'Çocuk bakımı'},
# 	{ name: 'Yaşlı bakımı'},
# 	{ name: 'Evcil hayvan bakımı'},

# ])

genel_skill_list = Tag.all.map(&:name)

# uid: "10153993065207769", email: "keremkurban@hotmail.com", name: "Kerem Kurban"
# uid: "984530874964450", email: "mmfates@hotmail.com", name: "A Fatih Muhammed"



100.times do |i|
	n1,n2,n3,n4 = [rand(1..9),rand(1..9),rand(1..9),rand(1..9)]
	ActiveRecord::Base.transaction do
		u = User.create({provider: "facebook", uid: "#{n1}#{n2}#{n3}#{n4}40354046927#{i}", 
		  email: nil,name: "Test#{i} #{Faker::Name.last_name}", username: nil, token: nil })

	  lat = "#{ rand(36..40) + SecureRandom.random_number }" 
	  lng = "#{ rand(27..43) + SecureRandom.random_number }"	
	 	point_query = "#{lat}, #{lng}"
		point_address = Geocoder.address(point_query)
		
		
		point_params = {"lat"=>lat, "lng"=>lng, "address"=>point_address, "point_type"=>"0"}	
	 	point =  u.points.build(point_params)
		point.user_uid = u.uid
		u.skill_list.add(genel_skill_list.sample)
		point.save 
		u.save
  end
end




