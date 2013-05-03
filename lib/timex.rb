module Timex

  def Timex.dayweek
    daynum= Time.now.utc.wday
    week={1=> "Monday", 2=> "Tuesday", 3=> "Wednesday", 4=> "Thursday", 5=> "Friday"}
    dayofweek= week[daynum]
  end

  def Timex.date
    time=Time.new
    date=time.month.to_s + "/" + time.day.to_s + "/" + time.year.to_s
  end

  def Timex.dayyear
    time=Time.new
    date=time.yday
  end
end
