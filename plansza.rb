class Plansza
  def initialize
    @kulki = Array.new(42, " ")

  end

  def rysuj
    puts "\n"
    (1..15).each {|x| x.odd? ? (print '-') : (print "#{x/2}") }
    puts "\n"
    (0...13).each do |x|
      if x.odd?
        print "#"
        i = (x/2) * 7
        (0..6).each {|y|print "#{@kulki[i+y]}#"}

      else
        (1..15).each {print "#"}

      end
      print "\n"
    end
    puts "\n"
  end

  def dodaj(gracz, kolumna)

    if @kulki[kolumna - 1] != " "
      puts "W tej kolumnie nie ma miejsca"
      return false
    else
      (0..5).each do |x|
        razy = 5 - x
        puts " Dupa"
        if @kulki[7*razy + kolumna - 1] == " "
          @kulki[7*razy + kolumna - 1] = gracz
          return true
        end
      end
    end
  end

  def wygranko(gracz)
    [0,1,2,3,7,8,9,10,14,15,16,17,21,22,23,24,27,28,29,30,35,36,37,38].each do |x|
      if ((0..3).all? {|y|@kulki[x+y] == gracz}) or ((0..3).all? {|y|@kulki[x+(y*8)] == gracz}) or ((0..3).all? {|y|@kulki[(x+3)+(y*6)] == gracz})
        return true
      end

    end

    (0..20).each do |x|
      if (0..3).all? {|y|@kulki[x+(y*7)] == gracz}
        return true
      end
    end
    return false
  end
end
