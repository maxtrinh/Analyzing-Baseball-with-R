library(tidyverse)
library(abdwr3edata)
library(here)

hofpitching <- hof_pitching |>
    mutate(BF_group = cut(
        BF,
        c(0, 10000, 15000, 20000, 30000),
        labels = c(
            "Less than 10,000",
            "(10,000, 15,000)",
            "(15,000, 20,000)",
            "more than 20,000"
        )
    ))

hofpitching %>% 
    summarise(N = n(),
              .by = BF_group) %>% 
    ggplot(aes(x = BF_group,
               y = N, fill = BF_group)) +
    geom_col() +
    geom_text(aes(label = N),
              vjust = -0.5,
              size = 8) +
    scale_y_continuous(
        expand = expansion(mult = c(0, .1)),
    ) +
    labs(
        title = "Number of Batters Faced by HOF pitchers in their career",
        x = "Number of Batters Pitchers Faced"
    ) +
    theme_bw() +
    theme(
        axis.text.x = element_text(
            angle = 45
        ),
        axis.title.y = element_blank(),
        legend.position = "none"
    ) 

ggsave("HOF pitchers BF.png",
       path = here("Analyzing-Baseball-with-R",
                   "Chapter 3", "output"))

hofpitching %>% 
    summarise(N = n(),
              .by = BF_group) %>% 
    ggplot(aes(x = BF_group,
               y = N, fill = BF_group)) +
    geom_point() +
    geom_text(aes(label = N),
              vjust = -0.5,
              size = 8) +
    scale_y_continuous(
        expand = expansion(mult = c(0.1, .1)),
    ) +
    labs(
        title = "Number of Batters Faced by HOF pitchers in their career",
        x = "Number of Batters Pitchers Faced"
    ) +
    theme_bw() +
    theme(
        axis.text.x = element_text(
            angle = 45
        ),
        axis.title.y = element_blank(),
        legend.position = "none"
    ) 

ggsave("HOF pitchers BF point chart.png",
       path = here("Analyzing-Baseball-with-R",
                   "Chapter 3", "output"))





