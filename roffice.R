library(officer)
library(magrittr)
library(tidyverse)
library(readxl)
library(knitr)

##set up
pres1 <- read_pptx("example.pptx") 
 
#Get Image
image <- "https://www.powderlife.com/wp-content/uploads/2017/11/equipment-buy-rent-diagram.jpg"
download.file(image,'image.jpg', mode = 'wb')

#Setup Table
Brands <- c("Nordica","Salomon","Moment","J Skis","Elan")
Price <- c('$749','$850','$729','$666','$800')
table <- as.data.frame(cbind(Brands,Price))
table <- kable()


## make slides

##HAO QIN-->slide 1 
pres1 %<>%  add_slide(layout = "Panoramic Picture with Caption", master = master) %>% 
  ph_with_text(type = "title", str  = "SKIING                                                                                      A Best Sport in this Winter") %>% 
  ph_with_text(type =  "dt", str = format(Sys.Date())) %>% 
  ph_with_text(type = "sldNum", str="Slide 1") %>% 
  ph_with_text(type = "ftr", str = "Hao, Siwei, Yifeng, Dave") %>%
  ph_with_img(type = "pic", src = "snowing.jpg", height = 3.5)

##slide 2
pres1 %<>%  add_slide(layout = "Section Header", master = master  ) %>% 
  ph_with_text(type = "title", str = "Introduction") %>% 
  ph_with_ul(type = "body", index = 1, 
             str_list = c(">> Weather", 
                          ">> Ski Resort", 
                          ">> Ski brands", 
                          ">> How to wear?", 
                          ">> Safety Tips"),
             level_list = c(1,1,1,1,1),style = fp_text(font.size = 25,bold = FALSE) ) %>%  ph_with_text(type =  "dt", str = format(Sys.Date())) %>% 
  ph_with_text(type = "sldNum", str="Slide 2") %>% 
  ph_with_text(type = "ftr", str = "Hao, Siwei, Yifeng, Dave") 


##YIFENG LUO-->slide 3 
pres1 %<>% add_slide(layout = "Panoramic Picture with Caption", master = master ) %>% 
  ph_with_img(type = "pic", src = "weather.png")%>% 
  ph_with_text(type =  "dt", str = format(Sys.Date())) %>% 
  ph_with_text(type = "sldNum", str="Slide 3") %>% 
  ph_with_text(type = "ftr", str = "Hao, Siwei, Yifeng, Dave") %>% ph_with_ul(type = "body", index = 1, 
                                                                              str_list = c("            The Weather during Thanksgiving Break",
                                                                                           "",
                                                                                           "",
                                                                                           "",
                                                                                           "",
                                                                                           "",
                                                                                           "",
                                                                                           "",
                                                                                           "",
                                                                                           "",
                                                                                           "",
                                                                                           " Pick a Sunny Day is a Good Start for You Trip",
                                                                                           "",
                                                                                           ""),style = fp_text(font.size = 26,italic = TRUE,font.family ='Chalkduster'),
                                                                              level_list = c(1,1,1,1,1,1,1,1,1,1,1,1,1,1))


##slide 4
pres1 %<>% add_slide(layout = "Panoramic Picture with Caption", master = master )  %>% 
  ph_with_img(type = "pic", src = "resort.png",height = 4)%>% 
  ph_with_text(type =  "dt", str = format(Sys.Date())) %>% 
  ph_with_text(type = "sldNum", str="Slide 4") %>% 
  ph_with_text(type = "ftr", str = "Hao, Siwei, Yifeng, Dave") %>%   ph_with_ul(type = "body", index = 1, 
                                                            str_list = c("",
                                                              "              Sunday River--A Great Place for Skiing",
                                                                         "",
                                                                         "",
                                                                         "",
                                                                         "",
                                                                         "",
                                                                         "",
                                                                         "",
                                                                         "",
                                                                         "",
                                                              "     There are 7 Skiing Routes for any Level of 'Adventurers'",
                                                                         "",
                                                                         "                       We are Waiting for You!"),style = fp_text(font.size = 26,italic = TRUE,font.family ='Chalkduster'),
                                                            level_list = c(1,1,1,1,1,1,1,1,1,1,1,1,1,1))


#dave-->Slide 5
pres1  %<>%  add_slide(layout = "Title and Content",master = master) %>% 
  ph_with_table_at(value = table,height = 4,width = 4,left = 5,top = 3) %>% 
  ph_with_text(type = "title", str = "Top-Selling Ski Brands with Prices", index = 1) %>% 
  ph_with_ul(type = "body",index = 1, str_list  = c("","","","","","","","· These are the top selling sets of skis from 2017. They are obviously a little expensive!"),style = fp_text(font.size = 22,italic = TRUE,font.family ='Chalkduster'),level_list=c(1,1,1,1,1,1,1,1))%>% 
  ph_with_text(type =  "dt", str = format(Sys.Date())) %>% 
  ph_with_text(type = "sldNum", str="Slide 5") %>% 
  ph_with_text(type = "ftr", str = "Hao, Siwei, Yifeng, Dave")


#Slide 6
pres1 %<>% add_slide(layout = "Title and Content",master = master) %>% 
  ph_with_text(type = "title", str = "What to Wear While Skiing") %>%
  ph_with_ul(type = "body", index = 1, str_list = c("","","","","","","     Staying Warm", "   · Gloves", "   · Scarf/Facemask", "   · Snow Pants/Jacket", "   · Boots", "     Equiptment", "   · Skis/Poles or Snowboard","   · Helmet","   · Goggles","   · Pads/Guards for Protection"), level_list = c(1,1,1,1,1,1,1,2,2,2,2,1,2,2,2,2),style = fp_text(font.size = 22,italic = TRUE,font.family ='Chalkduster')) %>%
  ph_with_img_at(src = "image.jpg",height = 3, width = 5, left = 6, top = 2)%>% 
  ph_with_text(type =  "dt", str = format(Sys.Date())) %>% 
  ph_with_text(type = "sldNum", str="Slide 6") %>% 
  ph_with_text(type = "ftr", str = "Hao, Siwei, Yifeng, Dave")

  
##siwei hu-->slide 7
pres1 %<>% add_slide(layout = "Picture with Caption", master = master ) %>% 
  ph_with_text(type = "title", str = "Keep safe when you ski") %>% 
  ph_with_ul(type = "body", index =1 ,str_list = c("","","","","","","","","","","            Tips on How to Ski Safely:",
                                                   "            · Exercise in advance", 
                                                   "            · You will have much more fun on the slopes if you're in good shape",
                                                   "            · Use proper ski equipment",
                                                   "            · Don't borrow equipment",
                                                   "            · Wear a helmet",
                                                   "            · Prepare for the weather",
                                                   "            · Get proper instruction",
                                                   "            · Wear goggles",
                                                   "            · Take a break",
                                                   "            · Ski with friends"),style = fp_text(font.size = 20,italic = TRUE,font.family ='Chalkduster'),
             level_list = c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)) %>% 
  ph_with_img(type = "pic", src = "ski.jpg", height = 3)%>% 
  ph_with_text(type =  "dt", str = format(Sys.Date())) %>% 
  ph_with_text(type = "sldNum", str="Slide 7") %>% 
  ph_with_text(type = "ftr", str = "Hao, Siwei, Yifeng, Dave")

#slide 8

pres1 %<>% add_slide(layout = "Title and Caption" , master = master) %>% 
  ph_with_ul(type = "body", index= 1,str_list = c("","","","","","","","","","",
                                                  "                 That's all and have a good trip","","",
                                                  "                                  Thank you!"),
             level_list = c(1,1,1,1,1,1,1,1,1,1,1,1,1,2),style = fp_text(font.size = 35,italic = TRUE,font.family ='Chalkduster'))%>% 
  ph_with_text(type =  "dt", str = format(Sys.Date())) %>% 
  ph_with_text(type = "sldNum", str="Slide 8") %>% 
  ph_with_text(type = "ftr", str = "Hao, Siwei, Yifeng, Dave")


print(pres1, target = "roffice_practice.pptx") 


