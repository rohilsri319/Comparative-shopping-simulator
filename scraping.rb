require 'nokogiri'
require 'open-uri'


def findVans
    vans = open("https://www.vans.com/shop/mens-shoes-classics?icn=subnav")
    doc = Nokogiri::HTML(vans)
    names = []
    prices = []
    doc.search(".product-block-name.name-js").each do |name|
        names << name.text
    end

    doc.search(".product-price.price").each do |price|
        prices << price.text
    end

    shoeList = names.zip(prices)
    cart = []
    shoeList.each do |name, price|
        puts("#{element}")
        puts("Add this item to cart?")
        answer = gets.chomp
        if(answer == "Yes" || answer == "yes" || answer == "y")
            cart << [name,price]
        end
    end
    puts(cart)
end

def findColeHaan
    coleHaan = open("https://www.colehaan.com/mens-shoes-sneakers")
    doc = Nokogiri::HTML(coleHaan)
    names = []
    prices = []
    doc.search(".tile-body").each do |name|
        names << name.text
    end
    cart = []
    shoeList = names.zip(prices)
    shoeList.each do |name|
        puts("#{name}")
        puts("Add this item to cart?")
        answer = gets
        if(answer == "Yes" || answer == "yes" || answer == "y")
            cart << name
        end
    end
end

def findAthletic
    vans = open("https://www.footlocker.com/category/sport/running/mens/shoes.html")
    doc = Nokogiri::HTML(vans)
    names = []
    prices = []
    doc.search(".ProductName").each do |name|
        names << name.text
    end
    doc.search(".ProductPrice").each do |price|
        prices << price.text
    end

    shoeList = names.zip(prices)
    cart = []
    shoeList.each do |name, price|
        puts("#{name}" + "#{price}")
        puts("Add this item to cart?")
        answer = gets.chomp
        if(answer == "Yes" || answer == "yes" || answer == "y")
            cart << [name, price]
        end
    end
    puts(cart)
end

def findFormal
    formal = open("https://www.florsheim.com/shop/styles/shoes/dress/page0.html?view=category")
    doc = Nokogiri::HTML(formal)
    names = []
    prices = []
    doc.search(".name").each do |name|
        names << name.text
    end
    doc.search(".price").each do |price|
        prices << price.text
    end

    shoeList = names.zip(prices)
    cart = []
    shoeList.each do |name, price|
        puts("#{name}" + "#{price}")
        puts("Add this item to cart?")
        answer = gets.chomp
        if(answer == "Yes" || answer == "yes" || answer == "y")
            cart << [name, price]
        end
    end
    puts(cart)
end


def styler(style)
    if(style == "athletic")
        findAthletic
    elsif(style == "casual")
        puts("choose your shoe brand: vans or converse")
        casBrand = gets.chomp
        if(casBrand == "vans")
            return findVans
        elsif(casBrand == "converse")
            findConverse
        end
    elsif(style == "formal")
            findFormal
    end
end 

#main program
puts("choose your shoe type: casual, athletic, or formal")
shoe = gets.chomp
styler(shoe)
