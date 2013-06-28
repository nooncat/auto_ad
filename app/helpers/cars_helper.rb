#encoding: UTF-8
module CarsHelper
  def next_photo_id
    current_id = @photo.id 
    id_ar = []
    for photo in @car.photos
      id_ar.push(photo.id)
    end
    if id_ar[id_ar.index(current_id)+1].nil?
      photo_id = id_ar[0]
    else 
      photo_id = id_ar[id_ar.index(current_id)+1]
    end
  end
  
  def validate_photos
    errors.add(:photos, "too much") if photos.length > 5
  end
  
  def car_names_list
    cnl = ["Acura","Alfa Romeo","Alpina","Aston Martin","Audi","Bentley","BMW","Bugatti","BYD","Cadillac","Chery","Chevrolet","Chrysler","Citroen","Daewoo","Dodge","Ferrari","Fiat","Ford","Geely","GMC","Great Wall","Haima","Honda","Hyundai","Infiniti","JAC","Jaguar","Jeep","Kia","Lamborghini","Land Rover","Lexus","Lifan","Lincoln","Lotus","Marussia","Maserati","Maybach","Mazda","Mercedes","Mini","Mitsubishi","Nissan","Opel","Peugeot","Porsche","Renault","Rolls-Royce","SEAT","Skoda","Smart","SsangYong","Subaru","Suzuki","Toyota","Volkswagen","Volvo","Vortex","ВАЗ","ГАЗ","ЗАЗ","ТагАЗ","УАЗ","Другая"]
  end

  def car_bodys_list
    cbl = ["Седан","Хетчбек","Универсал","Внедорожник","Кабриолет","Кроссовер","Купе","Лимузин","Минивэн","Пикап","Фургон"]
  end

  def car_engines_v_list
    cevl = []
    b = 7
    53.times {|i| cevl.push(((b+=1)/10.0).to_s)}
    cevl.push(">6.0")
  end

  def years_list
    yrs = []
    current_year = Time.now.year 
    for i in 1980..current_year
      yrs.push(i)
    end
    yrs.reverse.push("до 1980")
  end

  def mileage_list
    mal = ["0-4999",["5000-9999","5000"],["10000-14999","10000"],["15000-19999","15000"],["20000-24999","20000"],["25000-29999","25000"],["30000-34999","30000"],["35000-39999","35000"],["40000-44999","40000"],["45000-49999","45000"],["50000-54999","50000"],["55000-59999","55000"],["60000-64999","60000"],["65000-69999","65000"],["70000-74999","70000"],["75000-79999","75000"],["80000-84999","80000"],["85000-89999","85000"],["90000-94999","90000"],["95000-99999","95000"],["100000-109999","100000"],["110000-119999","110000"],["120000-129999","120000"],["130000-139999","130000"],["140000-149999","140000"],["150000-159999","150000"],["160000-169999","160000"],["170000-179999","170000"],["180000-189999","180000"],["190000-199999","190000"],["200000-249999","200000"],["250000-299999","250000"],["300000-349999","300000"],["350000-399999","350000"],["400000-449999","400000"],["450000-499999","450000"],">500000"]
  end
  
  def colors_list
    coll = ["Бежевый","Белый","Голубой","Желтый","Зеленый","Золотой","Коричневый","Красный","Оранжевый","Пурпурный","Розовый","Серебрянный","Серый","Синий","Фиолетовый","Черный"]
  end
end
