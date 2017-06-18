class Record

  def initialize(database,memberlist,reason)
    @database = CSV.read('database.csv', headers:true)
    $memberlist = CSV.read('memberlist.csv', headers:true)
    $reason = reason

  end

  def reason
    $reason
  end

  def dbase
    @database
  end

  def mlist
    $memberlist
  end
end
