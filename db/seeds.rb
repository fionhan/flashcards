Teacher.create(name: 'Jack', teacher_no: '1')
Teacher.create(name: 'Linda', teacher_no: '2')
Student.create(name: 'Amy', student_no: '1')
Student.create(name: 'Tom', student_no: '2')

Teacher.all.each do |t|
  t.deck=Deck.create(name: "#{t.name}sDeck")
end
Student.all.each do |s|
  s.deck=Deck.create(name: "#{s.name}sDeck")
end

Deck.all.each do |d|
  d.cards<<Card.create(front:'A',back:'b')
end


