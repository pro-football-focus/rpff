# PFF FC R Library
RPFF is an R library developed by [PFF FC](https://fc.pff.com/). It provides convenient access to the PFF FC API from applications written in R.

## Getting Your Questions Answered
If you have a question that is not addressed here, there are several ways to get in touch:
- Open a [GitHub Issue](https://github.com/pro-football-focus/rpff/issues)
- [Request a Feature](https://github.com/pro-football-focus/rpff/issues)
- Drop us a note at fchelp@pff.com 

## Documentation
See the [PFF FC API Documentation](https://fc.pff.com/docs). This documentation also includes PFF FC’s data specification. 

## API Sandbox Environment
PFF FC offers a Sandbox environment which provides convenient access to one league of your choosing, completely free of charge. The Sandbox is a test environment. As part of your access and use of the Sandbox you acknowledge that you have read, understood and agree to all terms of the [User Agreement](https://github.com/pro-football-focus/pypff/blob/main/docs/PFF%20API%20SANDBOX%20ENVIRONMENT%20USER%20AGREEMENT.pdf).

## Installation
Use your unique PFF FC API key or request an API key to PFF FC’s free-forever Sandbox environment by emailing fchelp@pff.com.

Installing RPFF requires `devtools`, if not yet installend, run `install.packages("devtools")`
```
devtools::install_github("pro-football-focus/rpff")
```

## Usage
After successfully installing the package, import it:
```
library(RPFF)
```
Make sure to set your environment variables to the URL and key that your are provided with.
```
Sys.setenv("pff-api-url" = "<<provided URL>>")
Sys.setenv("x-api-key" = "<<provided key>>")
```
In order to retrieve all competitions available to you, run:
```
get_competitions()
```
Or alternatively, request a specific competition only:
```
get_competition(competition_id)
```
In order to retrieve all teams available to you, run:
```
get_teams()
```
Or alternatively, request a specific team only:
```
get_team(team_id)
```
In order to retrieve all games from a specific competition, run:
```
get_games(competition_id)
```
Or alternatively, request a specific game only:
```
get_game(game_id)
```
In order to retrieve all players from a specific competition, run:
```
get_players_competition(competition_id)
```
Or alternatively, request a specific player only:
```
get_player(player_id)
```
In order to retrieve the roster of a specific game, run:
```
get_roster(game_id)
```
In order to retrieve all events of a specific game, run:
```
get_gameEvents(game_id)
```
Or alternatively, request a specific event only:
```
get_gameEvent(game_event_id)
```

## GraphQL Resources
GraphQL is the query language for PFF FC’s APIs and provides an alternative to REST and ad-hoc webservice architectures. It allows clients to define the structure of the data required, and exactly the same structure of the data is returned from the server. It is a strongly typed runtime which allows clients to dictate what data is needed.
- [Introduction to GraphQL](https://graphql.org/learn/)
- [How to GraphQL](https://www.howtographql.com/)
- [GraphQL Specification](https://spec.graphql.org/)
- [GraphQL FAQ](https://graphql.org/faq/)
