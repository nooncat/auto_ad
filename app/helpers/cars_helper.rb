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
end
