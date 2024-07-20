library(tidyverse)
library(Lahman)
library(abdwr3edata)
library(mlbplotR)
library(here)

Teams %>% 
    mutate(win_pct = W / (W + L)) %>% 
    filter(yearID == 2022) %>% 
    ggplot(aes(x = ERA, y = win_pct)) +
    geom_point() +
    geom_mlb_scoreboard_logos(
        aes(
            team_abbr = teamIDBR,
            ),
        width = 0.055
    )

ggsave("Winning percentage by ERA in 2022.png",
       path = here('Analyzing-Baseball-with-R',
                   'Chapter 3', 'output'))
