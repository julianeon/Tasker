module Timex

  def Timex.dayweek
    daynum= Time.now.utc.wday
    week={0=>"Sunday", 1=> "Monday", 2=> "Tuesday", 3=> "Wednesday", 4=> "Thursday", 5=> "Friday", 6=> "Saturday"}
    dayofweek= week[daynum]
  end

  def Timex.date
    time=Time.new
    date=time.month.to_s + "/" + time.day.to_s + "/" + time.year.to_s
  end

  def Timex.dayyear
    Time.now.yday
  end
  
  def Timex.stopwatch
    Time.now.to_i
  end
end
