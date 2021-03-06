shinyUI(navbarPage("Exploring the U.S. National Security Strategy Reports",
  tabPanel("About",
    fluidRow(
      column(6, offset = 3,
      p("This app lets you use some basic text-mining procedures to explore change over time in the
        national security concerns of the U.S. government as reflected in the 16 U.S. National Security
        Strategy Reports published irregularly by the White House from 1987 to 2015. The motivating
        assumption is that a term's prevalence in the report gives some indication of the salience of
        the entity or idea that term represents to the president's view of U.S. national security."),
      p("The data and scripts used to build this app can be found",
          a(href = "https://github.com/ulfelder/national-security-strategy", "here"),
        "on GitHub. ",
          a(href = "https://dartthrowingchimp.wordpress.com/", "Jay Ulfelder"),
        "built this app and maintains that repository. ",
          a(href = "https://github.com/igorbrigadir", "Igor Brigadir"),
        "contributed the Python code that converted the original PDFs to clean(ish) text, and ",
          a(href = "http://andybeger.com/author/andybeger/", "Andy Beger"),
        "and",
          a(href = "https://github.com/alspur", "Alex S."),
        "helped debug the R scripts along the way.")
      )
    )
  ),
  tabPanel("One-Grams",
    fluidRow(
      column(4,
        p("Use the text field below to select a term to plot, and check or uncheck the box to switch
          between normalized and raw counts, where 'normalized' means the raw count is divided by the total
          number of terms in the document. The plotting function will find all words in the data set (a
          term-document matrix) that include that term you type. For example, inputting 'afghan' will
          combine counts for the terms 'afghan', 'afghans', afghanistan', and 'afghanistans'. The function
          is not case sensitive."),
        textInput("term", h4("Input a term:"), value = "terror"),
        checkboxInput("normalize", h4("Normalize?"), value=TRUE)
      ),
      column(8, plotOutput("lineplot"))
    )
  ),
  tabPanel("Word Clouds",
    fluidRow(
      column(4,
        p("Pick a report to see a word cloud of the 50 terms most frequently used in it."),
        selectInput("report", h4("Select a report:"),
                    choices = list("1987" = 1, "1988" = 2, "1990" = 3, "1991" = 4, "1993" = 5, "1994" = 6, "1995" = 7, "1996" = 8, "1997" = 9, "1998" = 10, "1999" = 11, "2001" = 12, "2002" = 13, "2006" = 14, "2010" = 15, "2015" = 16),
                    selected = 1)
      ),
      column(8, plotOutput("cloud"))
    )
  ),
  tabPanel("Associations",
    column(4,
      p("Use the text box to the right to enter a (stemmed) term. The app will return a dot plot showing
        the 10 terms in the corpus most closely associated with that one and the strength of their
        association. If you get an error message, try stemmed versions of the term you have in mind (for
        example, use 'genocid' for genocide, or 'climat' for climate)."),
      textInput("term2", h4("Input a term:"), value = "genocid")
    ),
    column(8, plotOutput("dotplot"))
  )
))
