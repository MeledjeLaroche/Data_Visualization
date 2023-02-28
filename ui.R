#########################################################################
######### AGNIMEL MELEDJE R. GUY LAROCHE &  OUEDRAOGO M. MOHAMED ########
########################################################################


dashboardPage(
  dashboardHeader(title = "Assurance CI"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard",
               menuSubItem("Chiffre d'affaire",tabName = "ca"),
               menuSubItem("Prestation de sinstre",tabName = "pres")),
               menuItem("Autres graphe", tabName = "autre" )
      
    )

  ),
  
  dashboardBody(
    tabItems(
      tabItem("ca",
              fluidRow(
                valueBoxOutput("ca"),
                valueBoxOutput("percent_vie"),
                valueBoxOutput("percent_nonvie")
              ),
              fluidRow(
                box(
                  width = 8, status = "info", solidHeader = TRUE,
                  title = h2("Evolution du chiffre d'affaire des compagnies d'assurances en Côte d'Ivoire de 1987 à 2020"),
                  imageOutput("Plot", width = "100%", height = 600)
                ),
                box(
                  width = 4, status = "info", solidHeader = TRUE,
                  title = h2("COMMENTAIRE"),
                  sliderTextInput("year1",
                                  label = h5("Choisir l'année"),
                                  choices = unique(year1$ANNEE),
                                  selected = year1 %>% slice(1),
                                  grid = FALSE,
                                  animate = animationOptions(interval = 800, loop = FALSE)
                  ),
                  textOutput("max_taux"),
                  textOutput("annee"),
                  textOutput("nom")
                )
                
              )
      ),
      tabItem("pres",
              fluidRow(
                valueBoxOutput("pres"),
                valueBoxOutput("pres_vie"),
                valueBoxOutput("pres_nonvie")
              ),
              fluidRow(
                box(
                  width = 8, status = "info", solidHeader = TRUE,
                  title = h1("Evolution des prestations de sinistre"),
                  imageOutput("Plot_pres", width = "100%", height = 600)
                ),
                box(
                  width = 4, status = "info", solidHeader = TRUE,
                  title = h1("COMMENTAIRE"),
                  sliderTextInput("year2",
                                  label = h5("Choisir l'année"),
                                  choices = unique(year2$ANNEE),
                                  selected = year2 %>% slice(1),
                                  grid = FALSE,
                                  animate = animationOptions(interval = 800, loop = FALSE)
                  )
                )
                
              )
      ),
      tabItem("autre",
              fluidRow(
                box(
                  width = 8, status = "info", solidHeader = TRUE,
                  title = h1("Evolution du chiffre d'affaire par branche par entreprise"),
                  plotOutput("Plot_ca_branche", width = "100%", height = 600)
                ),
                box(
                  width = 4, status = "info", solidHeader = TRUE,
                  title = h2("Evolution du chiffre d'affaire par branche par entreprise"),
                  selectInput(
                    "ca_branche",
                    "Choisir une compagnie",
                    unique(data$NOM_SOCIETE),
                    selected = data$NOM_SOCIETE[1]
                              )
                )
                  
              )
      )
    )
  ),
  skin = "yellow"
)
