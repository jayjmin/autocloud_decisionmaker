controller = DecisionController.new

    uos = nil
#    uloc = {:city => "Sydney"}
    usvc = {:isspot => false, :contract => 30}
    ursrc = {:mincpu =>1, :minram => 1000, :minhdd => 40}
    uhours = 24*30


    ureq = {
      :os => uos, 
#      :location => uloc, 
      :service => usvc, 
      :rsrc => ursrc, 
      :hours => uhours}
  
    rates = controller.get_rate ureq

rates.each { |r|  puts r.price.to_s + "=" + r.show}
