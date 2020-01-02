require 'watir'
require 'nokogiri' 

class SearchResult
	attr_reader :node
	def initialize(node)
		@node = node
	end

  def title
		@title = @node.h3(:css => 'h3.LC20lb').text
		@title
	end

	def desc
		@desc = @node.span(:css => ".st").text
		@desc
	end

	def url
		@url = @node.a(:css => ".r a").href
		@url.slice(8,@url.length)
	end
end

class SearchResults
  DEFAULT_URL = "https://www.google.co.in/search?q="
  def initialize(results, url = DEFAULT_URL)
    @query = results[:query]
    santize_query_params(url)
    fetch_results
    save_results
  end

  private
  def fetch_results
    browser = Watir::Browser.new
    browser.goto(@url)
    @items = browser.divs(class_name: "g")
  end

  private
  def santize_query_params(url)
    @query [" "] = "+"
    @url = url << @query
  end
  
  private
  def save_results
    @search_results = []
    @items.each do |item|
      @search_results << SearchResult.new(item)
    end
  end

  public 
  def results
    @search_results
  end

end

test = SearchResults.new(:query => "ruby oops")
puts test.results[0].title
puts test.results[0].desc
puts test.results[0].url