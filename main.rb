require_relative 'product'

products = [
    Product.new("Pão", 5.00, "pão françês"),
    Product.new("Mel", 2.00, "mel de abelhas silvestres"),
    Product.new("Café", 3.50, "xícara de café pequena"),
    Product.new("Margarina", 3.50, "margarina doriana"),
    Product.new("Mortadela", 2.00, "mortadela defumada"),
    Product.new("Queijo Mussarela", 2.00, "queijo mussarela artesanal"),
    Product.new("Doce de leite", 3.00, "doce de leite amarelo"),
    Product.new("Garrafa D'Água", 1.90, "garrafa de água da fonte"),
]

puts "Bem vindo a nossa loja!"
puts "Produtos disponíveis:"

products.each_with_index do |product, index|
    puts "#{index + 1} - #{product.name} R$ #{'%.2f' % product.price} - #{product.description.capitalize}"
  end

loop do
    selected_products = []
    total_price = 0.0

    puts "\nDigite o número do produto desejado ou 0 para encerrar:"
    
    while true
        selection = gets.chomp.to_i
        break if selection == 0

        selected_product = products[selection - 1]
        if selected_product.nil?
            puts "Não temos esse produto!. Por favor, selecione um produto que esteja na lista:"
            next
        end

        selected_products << selected_product
        total_price += selected_product.price

        puts "\nProdutos selecionados:"
        selected_products.each { |product| puts "#{product.name}" }
        puts "Preço a pagar: R$ #{'%.2f' % total_price}"

        puts "\nDigite o número do próximo produto desejado ou 0 para encerrar:"
    end

    break if selected_products.empty?

    puts "\nTotal a pagar: R$ #{'%.2f' % total_price}"
    puts "1 - Pagar, 2 - Selecionar mais produtos"
    option = gets.chomp.to_i

    break if option == 1
end

puts "\nObrigado por comprar conosco, volte sempre! 👋"