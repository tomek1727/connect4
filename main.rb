load "plansza.rb"

def koniec(gracz)
  puts "Koniec gry!"
  puts "Wygrywa #{gracz}"
  exit(0)
end

def interfejs(gracz)
  begin

    puts "Ruch gracza #{gracz}"
    puts "Wybierz kolumne gdzie chcesz wrzucic klocka: "
    kolumna = $stdin.gets.chomp.to_i
    if kolumna < 1 or kolumna > 7
      puts "\nNie poprawny numer kolumny\n"
      interfejs(gracz)
    end
    
  end until $plansza.dodaj(gracz, kolumna)
  $plansza.rysuj
  koniec(gracz) if $plansza.wygranko(gracz)
  gracz == "x" ? gracz = "o" : gracz = "x"
  interfejs(gracz)
end

$plansza = Plansza.new
$plansza.rysuj
puts "Witaj w grze connect4\nAby wygrać należy połączyć 4 takie same znaczki w lini\nPowodzenia\n\n\n"

interfejs("x")
