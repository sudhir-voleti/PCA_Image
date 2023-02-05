library(dplyr)
shinyUI(fluidPage(
    
    title = "PCA on Image",
    titlePanel(title=div(img(src="logo.png",align='right'),"PCA on Image")),
    sidebarPanel(
        
        conditionalPanel(condition = "input.tabselected==1",
                         fileInput(inputId = "file",
                                   label = h6("Upload Image"),
                                   multiple = FALSE,
                                   accept = "image/*"),
                         #fileInput("file", "Upload Input file"),
                         
        ),
        conditionalPanel(condition="input.tabselected==2",
                         h5("Resizing & Gray Scale"),
                         numericInput("w","Width", min = 100,max = 1024,value = 200),
                         numericInput("h","Height", min = 100,max = 1024,value = 200),
                         checkboxInput("bw","Change to Grayscale",value = TRUE),
                         numericInput("k","Select K",min = 2,max=50,value=2)
        ),
        
        
    ),
    mainPanel(

        tabsetPanel(
            tabPanel("Overview & Example Dataset", value=1, 
                     includeMarkdown("overview.md")
            ),
            tabPanel("Summary", value=1,
                     h4("Uploaded Image"),
                     imageOutput("img"),
                     hr(),
                     h4("Image Dimensions (H X W X RGB)"),
                     verbatimTextOutput("dimss"),
                     hr(),
                     h4("No of Pixels"),
                     verbatimTextOutput("pix")
                
                     
            ),
            tabPanel("Factorizing Pixel Matrices", value=2,
                     h4("Resized & Grayscale Image"),
                     imageOutput("rs_img"),
                     h4("Gray Scale Image Dimensions (H X W)"),
                     verbatimTextOutput("gray_dimss"),
                     hr(),
                     h4("No of Pixels (Gray Scale)"),
                     verbatimTextOutput("gray_pix"),
                     hr(),
                     h4("PCA on Resized Image"),
                     plotOutput("pca_img"),
                     h4("PCA Image Dimensions (H X W)"),
                     verbatimTextOutput("pca_dimss"),
                     hr(),
                     h4("No of Pixels (PCA Image)"),
                     verbatimTextOutput("pca_pix"),
                     hr()
                    
                    # h4("NMF on Resized Image"),
                     #plotOutput("nmf_img")
                     
            ),
            id = "tabselected"
        )
    )
))

