class Quote
  attr_accessor :hash

  def initialize
    info = RestClient.get("https://zenquotes.io/api/random")
    @hash = JSON.parse(info)[0]
  end

  def pretty
    quote = hash["q"] 
    source = hash["a"]

    puts quote
    puts "- #{source}"

  end

end