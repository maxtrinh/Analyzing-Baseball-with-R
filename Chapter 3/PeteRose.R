hittersBirthYear <- People %>% 
    filter(playerID %in% c('cobbty01',
                           'willite01',
                           'rosepe01')) %>%
    select(playerID, birthYear, nameLast)

hitters <- Batting %>% 
    filter(playerID %in% c('cobbty01',
                           'willite01',
                           'rosepe01')) %>% 
    merge(., y = hittersBirthYear) %>% 
    mutate(Age = yearID - birthYear) %>% 
    mutate(totalHits = cumsum(H),
           .by = playerID)

hitters %>% 
    ggplot(aes(x = Age, y = totalHits,
               color = nameLast,
               )) +
    geom_line() +
    labs(
        x = "Age",
        y = "Cumulative Hits"
    )


ggsave("Pete Rose Cumulative hits by Age.png")




