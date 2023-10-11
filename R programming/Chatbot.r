#welcome page

menu <- c("Ultimate Cheese Melt","Tuna Delight","Veggie","Margherita","Pepperoni")
prices <-c(150,173,189,199,219)
Size <-c("S","M","L")
total_price <- 0
menu_df <- data.frame(menu, prices)

chatbot <- function(){
  repeat { print("welcome to cat pizza shop, press yes to see the menu and order")
  cus_res <- readLines("stdin", n=1)
if (cus_res == "yes") {
  print(menu_df)
  
  print("select the menu you want")
  cus_order <- readLines("stdin",n=1)
  }
  
  if( cus_order == "Ultimate Cheese Melt" ){
    print(paste("you order is", cus_order, "and the price is", menu_df[menu_df$menu==cus_order,2]))
    total_price = total_price + 150
    
  } else if(cus_order == "Tuna Delight" ){
    print(paste("you order is", cus_order, "and the price is", menu_df[menu_df$menu==cus_order,2]))
        total_price = total_price + 173
    
  } else if(cus_order == "Veggie" ){
    print(paste("you order is", cus_order, "and the price is", menu_df[menu_df$menu==cus_order,2]))
        total_price = total_price + 189
    
  } else if(cus_order == "Margherita" ){
    print(paste("you order is", cus_order, "and the price is", menu_df[menu_df$menu==cus_order,2]))
        total_price = total_price + 199
   
  } else if(cus_order == "Pepperoni" ){
    print(paste("you order is", cus_order, "and the price is", menu_df[menu_df$menu==cus_order,2]))
        total_price = total_price + 219
  }
    print("what size do you want? (S + 20, M + 38, L + 50)")
    size <- readLines("stdin",n=1)
    if(size == "S"){
      print(paste("Your size is", size))
      total_price = total_price + 20
  } else if(size == "M"){
      print(paste("Your size is", size))
      total_price = total_price + 38
  } else if(size == "L"){
      print(paste("Your size is", size))
      total_price = total_price + 50
  }
    print("do you want to order more? Y/N")
      more <- readLines("stdin",n=1)
    
    if(more == "N"){
      break
    }
}     
      print(paste("your pizza is", cus_order, "the size is", size, "total price", total_price))
}

chatbot()
