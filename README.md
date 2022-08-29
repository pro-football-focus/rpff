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
```
devtools::install_github("pro-football-focus/rpff")
```

## Usage
After successfully installing the package, import it:
```
from pypff import pff
```
In order to retrieve all leagues available to you, run:
```
pff.get_leagues(url, key)
```
Or alternatively, request a specific league only:
```
pff.get_league(url, key, league_id = 1)
```
In order to retrieve all teams available to you, run:
```
pff.get_teams(url, key)
```
Or alternatively, request a specific team only:
```
pff.get_team(url, key, team_id = 1)
```
In order to retrieve all games from a specific league, run:
```
pff.get_games(url, key, league_id = 1)
```
Or alternatively, request a specific game only:
```
pff.get_game(url, key, game_id = 1381)
```
In order to retrieve all players available to you, run:
```
pff.get_players(url, key)
```
Or alternatively, request a specific player only:
```
pff.get_player(url, key, player_id = 1)
```
In order to retrieve the roster of a specific game, run:
```
pff.get_roster(url, key, game_id = 1381)
```
In order to retrieve all events of a specific game, run:
```
pff.get_game_events(url, key, game_id = 1381)
```
Or alternatively, request a specific event only:
```
pff.get_game_event(url, key, game_event_id = 1820408)
```

## GraphQL Resources
GraphQL is the query language for PFF FC’s APIs and provides an alternative to REST and ad-hoc webservice architectures. It allows clients to define the structure of the data required, and exactly the same structure of the data is returned from the server. It is a strongly typed runtime which allows clients to dictate what data is needed.
- [Introduction to GraphQL](https://graphql.org/learn/)
- [How to GraphQL](https://www.howtographql.com/)
- [GraphQL Specification](https://spec.graphql.org/)
- [GraphQL FAQ](https://graphql.org/faq/)
