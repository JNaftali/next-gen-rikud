sessions = []

sessions << {
	title: 				"michal",
	url:   				"http://www.michal.com",
	description:  "Ossim chick. Takes like seven woks a day. Loves dat buti yoga."
}

sessions.each { |link| Session.find_or_create_by(link) }
