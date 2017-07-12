option = 1
while option > 0 && option <= 4
  puts 'Welcome, choose an option'
  puts 'Option 1 : Generate average student grades'
  puts 'Option 2 : The number of total absences'
  puts 'Option 3 : Names of students approved'
  puts 'Option 4 : Exit'
  option = gets.chomp.to_i
  if option >= 1 && option <= 4
    case option
    when 1
      file = File.open('course_notes.cv', 'r')
      data = file.readlines
      file.close
      file = File.open('averages.cv', 'w')
      data.each do |k|
        l = k.split(', ')
        file.print "#{l[0]}:\t\t"
        d = l.inject(0) { |sum, el| sum + el.to_i }
        file.print d / l.size.to_f
        file.puts
      end
      file.close

      when 2
        puts 'Total absences'

        file = File.open('course_notes.cv', 'r')
        data = file.readlines
        file.close
        data.each_slice(6) do |l|
          d = data.map { |g| g.chomp.split(', ') }
          c = data.map { |e| e.count('A')}
          print c.inject(&:+)
        end
        puts

      when 3
        def Approved(grade)
        puts 'Los aprobados son: '
        file = File.open('course_notes.cv', 'r')
        data = file.readlines
        file.close
        data.each do |e|
          j = e.split(', ').map { |e| e.chomp }
          l = j.inject(0) { |sum, e| sum + e.to_i }
          prom = l.to_f / j.size - 1
          if prom >= grade
            name = j[0]
            puts " #{name} : #{prom}"
          end
        end
        end
        Approved(5.0)
      else
        option = 99
    end
  else
    option = 2
  end

end
