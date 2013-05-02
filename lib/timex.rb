module Timex

  def getdayweek
    daynum= Time.now.utc.wday
    week={1=> "Monday", 2=> "Tuesday", 3=> "Wednesday", 4=> "Thursday", 5=> "Friday"}
    dayofweek= week[daynum]
  end

  # GET /tasks
  # GET /tasks.json
  def thisdate
    time=Time.new
    date=time.month.to_s + "/" + time.day.to_s + "/" + time.year.to_s
  end
end
