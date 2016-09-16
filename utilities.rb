
def leap_year?(year)
	multiple?(year, 100) ? multiple?(year, 400) : multiple?(year, 4)
end

def multiple?(year, divisor)
	year % divisor == 0
end


def percent_year(seconds)
	format_as_percentage((seconds / SECONDS_IN_A_YEAR) * 100)
end

SECONDS_IN_A_YEAR = 60 * 60 * 24 * 365 * 1.0 # 31536000.0

def format_as_percentage(n)
	'%.1f' % n + '%'
end


def standard_to_military(time)
	hours, b = time.split(":")
	minutes, am_or_pm = b.split(" ")

	if hours == "12"
		return am_or_pm == "am" ? "0:00" : ("12:00")
	end

	format_as_military_time(hours, minutes, am_or_pm)

end

def format_as_military_time(hours, minutes, am_or_pm)
	am_or_pm.downcase == "am" ? hours + ":" + minutes : (hours.to_i + 12).to_s + ":" + minutes
end


def military_to_standard(time)
	hours, minutes = time.split(":")

	if hours == "0" || hours == "12"
		return hours == "0" ? "12:00 am" : "12:00 pm"
	end

	hours.to_i < 12 ? format_as_standard_time(hours, minutes, "am") : format_as_standard_time((hours.to_i - 12).to_s, minutes, "pm")

end

def format_as_standard_time(hours, minutes, am_or_pm)
		hours + ":" + minutes + " " + am_or_pm
end


def curfew?(time, is_weekday)
	hours, minutes = time.split(":")
	minutes, am_or_pm = minutes.split(" ")

	if am_or_pm == "pm"
		return !((hours.to_i >= 8 && is_weekday) || (hours.to_i >= 10 && !is_weekday))
	end

	true
end

def span(a, b)
	c = 0
	d = 0
	if a < b
		c = b
		d = a
	else
		c = a
		d = b
	end

	return ('%.1f' % (amount(c)[0..-2].to_f - amount(d)[0..-2].to_f)).to_s + '%'
end
