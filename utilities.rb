
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

	if am_or_pm.downcase == 'pm'
		if hours == "12"
			return ("12:00")
		else
			return((hours.to_i + 12).to_s + ":" + minutes)
		end
	elsif am_or_pm.downcase == 'am'
		if hours == "12"
			return ("0:00")
		else
			return(hours + ":" + minutes)
		end
	end

end

def convert2(x)
	a, b = x.split(":")
	c = ""

	if a.to_i < 12
		c = a + b + " am"
	else
		c = a + b + " pm"
	end

	return c
end

def okay(a, b)
	c = false
	if (a.split(":")[0].to_i >= 8 && b || a.split(":")[0].to_i >= 10 && !b) && a.split(":")[1].split(" ")[1] == 'pm'
		c = false
	else
		c = true
	end
	return c
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
