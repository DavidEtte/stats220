library(magick)

#Code for setting the base image
meme_base <- image_read("inspo_meme.png")%>%
  image_scale(250)

#Code for creating all the blank images and text
text_base <- image_blank(width = 250, height = 315, color = "#000000")%>%
  image_annotate(text = "Me when fail Stats220",
                 color = "#FFFFFF",
                 size = 20,
                 font = "Comic Sans",
                 gravity = "Center")

text_moustache <- image_blank(width = 250, height = 315, color = "#000000")%>%
  image_annotate(text = "Me when change name
  and live in the bush",
                 color = "#FFFFFF",
                 size = 20,
                 font = "Comic Sans",
                 gravity = "Center")

text_bear <- image_blank(width = 200, height = 50, color = "#333333")%>%
  image_annotate(text = "I'm scared of bears",
                 color = "#FFFFFF",
                 size = 20,
                 font = "Comic Sans",
                 gravity = "Center")

#Setting the image of a moustache to be overlayed
moustache <- image_read("Moustache.png")%>%
  image_scale (200)

#layering the moustache on the base image  
meme <- image_composite(meme_base, moustache, offset = "+25+100")

#layering new text over the moustache version of the base image
meme_text <- image_composite(meme, text_bear, offset = "+25+265")

#creating a vector to store the frames of animation
animation_vector <- c(text_base, meme_base, text_moustache, meme_text)

#creating the animation
animation <- image_animate(animation_vector,fps=0.5)

#saving the final product
image_write(animation, "my_animation.gif")
