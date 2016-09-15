require 'minitest/autorun'
require './utilities'

# write tests here

describe 'utilities' do

  describe 'leap_year?' do

    it 'multiples of 4 are leap years' do
      leap_year?(2016).must_equal(true)
      leap_year?(2008).must_equal(true)
      leap_year?(4).must_equal(true)
    end

    it 'other years are not leap years' do
      leap_year?(2015).must_equal(false)
    end

    it 'multiples of 100 are leap years when also multiples of 400' do
      leap_year?(2000).must_equal(true)
      leap_year?(1200).must_equal(true)
    end

    it 'multiples of 100 are not leap years when not multiples of 400' do
      leap_year?(1900).must_equal(false)
      leap_year?(1300).must_equal(false)
    end

  end

  describe 'percent_year' do

    it 'is calculates the percent'do
      percent_year(15768000).must_equal("50.0%")
      percent_year(7884000).must_equal("25.0%")
      percent_year(23652000).must_equal("75.0%")
    end

    it 'is 0 percent at 0' do
      percent_year(0).must_equal("0.0%")
    end

    it 'is 100 percent when a year' do
      percent_year(31536000).must_equal("100.0%")
    end

  end

  describe 'standard_to_military' do

    it 'works in am' do
      standard_to_military("7:34 am").must_equal("7:34")
    end

    it 'works in pm' do
      standard_to_military("3:12 pm").must_equal("15:12")
    end

    it 'works at noon' do
      standard_to_military("12:00 pm").must_equal("12:00")
    end

    it 'works at midnight' do
      standard_to_military("12:00 am").must_equal("0:00")
    end

  end



end
