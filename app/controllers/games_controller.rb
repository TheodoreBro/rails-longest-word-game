require 'rest-client'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @letters = params[:letters].split(' ')
    @query = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@query}"
    response = RestClient.get(url)
    data = JSON.parse(response)
    query = @query.split('')
      raise
    if ((query - @letters) == []) && (data['found'])
      return @results = "congratulations #{@query} is a valid english word"
      @score = @query.length
    elsif (query - @letters) == [] && (data['found'] == false)
      return @results = "sorry but #{@query} does't seem to be an english word"
    else
      return @results = "sorry but #{@query} can't be built with #{@letters}"
    end
  end
end

# The word can't be built out of the original grid
# The word is valid according to the grid, but is not a valid English word
# The word is valid according to the grid and is an English word
