# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
  {name: 'Weekly Sessions', shortname: 'Weekly'},
  {name: 'Israeli Dance Festival DC', shortname: 'Festival'},
  {name: 'Schools and Universities', shortname: 'Schools'},
  {name: 'Nearby Weekends and Camps', shortname: 'Camps'},
  {name: 'Performance Groups', shortname: 'Performing'},
  {name: 'Special Events', shortname: 'Events'},
  {name: 'Local Markidim (instructors) for Hire', shortname: 'Instructors'}
])
Category.find_by(name: 'Weekly Sessions').links.create([
  {title: 'Sunday Morning', url: 'http://www.bccjcg.org/', facebook: 'https://www.facebook.com/groups/332639356503/', name: 'Sarah Krosner', email: 'dance_bccjcg@yahoo.com'},
  {title: 'Sunday Night', url: 'http://edcjcc.org/center-for-arts/dance/rikuddc/', facebook: 'https://www.facebook.com/groups/2250460548/?fref=nf', name: 'Noah Glushkow-Smith', email: 'rikuddc@gmail.com'},
  {title: 'Monday Night', url: 'http://www.templeemanuelmd.org/index.php/monthly-calendar/monthly-calendar', name: 'Ken Avner', email: 'ken@kenavner.com'},
  {title: 'Tuesday Night', url: 'http://ohrkodesh.org/calendar', facebook: 'https://www.facebook.com/MarkidMike/', name: 'Mike Fox', email: 'markidmike@gmail.com'},
  {title: 'Thursday Night', url: 'http://www.shaaretefila.org/whats-happening/calendar-3/', name: 'Ken Avner', email: 'Ken@KenAvner.com'},
  {title: 'Saturday Oldies Parties', url: ': http://www.greenbeltmd.gov/Facilities/Facility/Details/Greenbelt-Community-Center-2', name: 'Ben Hole', email: 'Ben.Hole@verizon.net'}
])
