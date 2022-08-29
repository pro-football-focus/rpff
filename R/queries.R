#' Get All Leagues Function
#'
#' This function allows you to get all leagues you currently have access to.
#' @keywords Leagues
#' @export
#' @examples
#' get_leagues()
get_leagues <- function() {

query <- '
query leagues {
    leagues {
        id
        name
        games {
            id
            season
        }
    }
}
'

  df = as.data.frame(GQL(query))
  return(df)
}



######################################
# Function get_league given league_id
#####################################

get_league <- function(id) {

query <- '
query league ($id: ID!) {
    league (id: $id) {
        id
        name
        games {
            id
            season
        }
    }
}
'

variables <- paste('
{
    "id":',id,'
}
')

df = as.data.frame(GQL(query,variables))
return(df)
}

######################################
# Function get_teams
#####################################

get_teams <- function() {

  query <- '
query teams {
    teams {
        id
        name
        shortName
        country
        homeGames {
            id
        }
        awayGames {
            id
        }
    }
}
'

df = as.data.frame(GQL(query))
return(df)
}

######################################
# Function get_team given team id
#####################################

get_team <- function(id) {

query <- '
query team ($id: ID!) {
    team (id: $id) {
        id
        name
        shortName
        country
        homeGames {
            id
        }
        awayGames {
            id
        }
    }
}
'

variables <- paste('
{
    "id":',id,'
}
')

df = GQL(query,variables)
return(df)

}

######################################
# Function get_games given league id
#####################################

get_games <- function(league_id) {

  query <- '
query league ($id: ID!) {
    league (id: $id) {
        id
        name
        games {
            id
            date
            season
            week
            homeTeam {
                id
                name
                shortName
            }
            awayTeam {
                id
                name
                shortName
            }
            startPeriod1
            endPeriod1
            startPeriod2
            endPeriod2
            period1
            period2
            halfPeriod
            homeTeamStartLeft
            homeTeamKit {
                name
                primaryColor
                primaryTextColor
                secondaryColor
                secondaryTextColor
            }
            awayTeamKit {
                name
                primaryColor
                primaryTextColor
                secondaryColor
                secondaryTextColor
            }
        }
    }
}
'

variables <- paste('
{
    "id":',league_id,'
}
')

df = as.data.frame(GQL(query,variables))
return(df)
}


######################################
# Function get_game given game id
#####################################

get_game <- function(id) {

  query <- '
query game ($id: ID!) {
    game (id: $id) {
        id
        league {
            id
            name
        }
        date
        season
        week
        homeTeam {
            id
            name
            shortName
        }
        awayTeam {
            id
            name
            shortName
        }
        startPeriod1
        endPeriod1
        startPeriod2
        endPeriod2
        period1
        period2
        halfPeriod
        homeTeamStartLeft
        homeTeamKit {
            name
            primaryColor
            primaryTextColor
            secondaryColor
            secondaryTextColor
        }
        awayTeamKit {
            name
            primaryColor
            primaryTextColor
            secondaryColor
            secondaryTextColor
        }
    }
}
'

variables <- paste('
{
    "id":',id,'
}
')

df = as.data.frame(GQL(query,variables))
return(df)
}

######################################
# Function get_players
#####################################

get_players <- function(id) {

  query <- '
query players {
    players {
        id
        firstName
        lastName
        nickname
        positionGroupType
        nationality {
            id
            country
        }
        secondNationality {
            id
            country
        }
        weight
        height
        dob
        gender
        countryOfBirth {
            id
            country
        }
        euMember
        rosters {
            game {
                id
            }
            started
        }
    }
}
'

df = as.data.frame(GQL(query))
return(df)
}


######################################
# Function get_player given player_id
#####################################

get_player <- function(id) {

  query <- '
query player ($id: ID!) {
    player (id: $id) {
        id
        firstName
        lastName
        nickname
        positionGroupType
        nationality {
            id
            country
        }
        secondNationality {
            id
            country
        }
        weight
        height
        dob
        gender
        countryOfBirth {
            id
            country
        }
        euMember
        rosters {
            game {
                id
            }
            started
        }
    }
}
'

variables <- paste('
{
    "id":',id,'
}
')

df = GQL(query,variables)
return(df)
}


######################################
# Function get_roster given game_id
#####################################

get_roster <- function(game_id) {

  query <- '
query game ($id: ID!) {
    game (id: $id) {
        id
    rosters {
        player {
            id
            nickname
        }
        positionGroupType
        shirtNumber
        team {
            id
            name
        }
    }
}
}
'

variables <- paste('
{
    "id":',game_id,'
}
')

df = as.data.frame(GQL(query,variables))
return(df)
}


#########################################
# Function get_game_events given game_id
#########################################

get_gameEvents <- function(game_id) {

  query <- '
query game ($id: ID!) {
    game (id: $id) {
        id
        gameEvents {
            advantageType
            bodyType
            duration
            earlyDistribution
            endTime
            endType
            formattedGameClock
            gameClock
            gameEventType
            heightType
            initialTouchType
            insertedAt
            otherPlayer {
                id
                nickname
            }
            outType
            player {
                id
                nickname
            }
            playerOff {
                id
                nickname
            }
            playerOffType
            playerOn {
                id
                nickname
            }
            pressurePlayer {
                id
                nickname
            }
            pressureType
            scoreValue
            setpieceType
            startTime
            subType
            team {
                id
                name
            }
            touches
            touchesInBox
            updatedAt
            videoAngleType
            video {
                id
            }
            videoMissing
            videoUrl
            defenderLocations {
                eventModule
                name
                x
                y
            }
            offenderLocations {
                eventModule
                name
                x
                y
            }
            possessionEvents {
                duration
                endTime
                formattedGameClock
                gameClock
                id
                insertedAt
                possessionEventType
                startTime
                updatedAt
                videoUrl
                ballCarryEvent {
                    additionalChallenger1 {
                        id
                        nickname
                    }
                    additionalChallenger2 {
                        id
                        nickname
                    }
                    additionalChallenger3 {
                        id
                        nickname
                    }
                    advantageType
                    ballCarrierPlayer {
                        id
                        nickname
                    }
                    ballCarryType
                    betterOptionPlayer {
                        id
                        nickname
                    }
                    betterOptionTime
                    betterOptionType
                    carryType
                    createsSpace
                    defenderPlayer {
                        id
                        nickname
                    }
                    id
                    insertedAt
                    leadsToType
                    linesBrokenType
                    opportunityType
                    pressurePlayer {
                        id
                        nickname
                    }
                    touchOutcomeType
                    touchType
                    updatedAt
                }
                challengeEvent {
                    additionalChallenger1 {
                        id
                        nickname
                    }
                    additionalChallenger2 {
                        id
                        nickname
                    }
                    additionalChallenger3 {
                        id
                        nickname
                    }
                    advantageType
                    ballCarrierPlayer {
                        id
                        nickname
                    }
                    betterOptionPlayer {
                        id
                        nickname
                    }
                    betterOptionTime
                    betterOptionType
                    challengeOutcomeType
                    challengeType
                    challengeWinnerPlayer {
                        id
                        nickname
                    }
                    challengerHomePlayer {
                        id
                        nickname
                    }
                    challengerAwayPlayer {
                        id
                        nickname
                    }
                    challengerPlayer {
                        id
                        nickname
                    }
                    createsSpace
                    dribbleType
                    insertedAt
                    keeperPlayer {
                        id
                        nickname
                    }
                    linesBrokenType
                    missedTouchPlayer {
                        id
                        nickname
                    }
                    missedTouchType
                    opportunityType
                    pressurePlayer {
                        id
                        nickname
                    }
                    tackleAttemptType
                    trickType
                    updatedAt
                }
                clearanceEvent {
                    advantageType
                    ballHeightType
                    betterOptionPlayer {
                        id
                        nickname
                    }
                    betterOptionTime
                    betterOptionType
                    blockerPlayer {
                        id
                        nickname
                    }
                    clearanceBodyType
                    clearanceOutcomeType
                    clearancePlayer {
                        id
                        nickname
                    }
                    createsSpace
                    failedInterventionPlayer {
                        id
                        nickname
                    }
                    failedInterventionPlayer1 {
                        id
                        nickname
                    }
                    failedInterventionPlayer2 {
                        id
                        nickname
                    }
                    failedInterventionPlayer3 {
                        id
                        nickname
                    }
                    insertedAt
                    missedTouchPlayer {
                        id
                        nickname
                    }
                    missedTouchType
                    opportunityType
                    pressurePlayer {
                        id
                        nickname
                    }
                    pressureType
                    shotInitialHeightType
                    shotOutcomeType
                    updatedAt
                }
                crossEvent {
                    advantageType
                    ballHeightType
                    betterOptionPlayer {
                        id
                        nickname
                    }
                    betterOptionTime
                    betterOptionType
                    blockerPlayer {
                        id
                        nickname
                    }
                    clearerPlayer {
                        id
                        nickname
                    }
                    completeToPlayer {
                        id
                        nickname
                    }
                    createsSpace
                    crossHighPointType
                    crossOutcomeType
                    crossType
                    crossZoneType
                    crosserBodyType
                    crosserPlayer {
                        id
                        nickname
                    }
                    defenderBallHeightType
                    defenderBodyType
                    defenderPlayer {
                        id
                        nickname
                    }
                    deflectorBodyType
                    deflectorPlayer {
                        id
                        nickname
                    }
                    failedInterventionPlayer {
                        id
                        nickname
                    }
                    failedInterventionPlayer1 {
                        id
                        nickname
                    }
                    failedInterventionPlayer2 {
                        id
                        nickname
                    }
                    failedInterventionPlayer3 {
                        id
                        nickname
                    }
                    incompletionReasonType
                    insertedAt
                    intendedTargetPlayer {
                        id
                        nickname
                    }
                    keeperPlayer {
                        id
                        nickname
                    }
                    missedTouchPlayer {
                        id
                        nickname
                    }
                    missedTouchType
                    noLook
                    opportunityType
                    pressurePlayer {
                        id
                        nickname
                    }
                    pressureType
                    receiverBallHeightType
                    receiverBodyType
                    secondIncompletionReasonType
                    shotInitialHeightType
                    shotOutcomeType
                    updatedAt
                }
                passingEvent {
                    advantageType
                    ballHeightType
                    betterOptionPlayer {
                        id
                        nickname
                    }
                    betterOptionTime
                    betterOptionType
                    blockerPlayer {
                        id
                        nickname
                    }
                    createsSpace
                    defenderBodyType
                    defenderHeightType
                    defenderPlayer {
                        id
                        nickname
                    }
                    deflectorBodyType
                    deflectorPlayer {
                        id
                        nickname
                    }
                    failedInterventionPlayer {
                        id
                        nickname
                    }
                    failedInterventionPlayer1 {
                        id
                        nickname
                    }
                    failedInterventionPlayer2 {
                        id
                        nickname
                    }
                    failedInterventionPlayer3 {
                        id
                        nickname
                    }
                    incompletionReasonType
                    insertedAt
                    linesBrokenType
                    missedTouchPlayer {
                        id
                        nickname
                    }
                    missedTouchType
                    noLook
                    opportunityType
                    passAccuracyType
                    passBodyType
                    passHighPointType
                    passOutcomeType
                    passType
                    passerPlayer {
                        id
                        nickname
                    }
                    pressurePlayer {
                        id
                        nickname
                    }
                    pressureType
                    receiverBodyType
                    receiverFacingType
                    receiverHeightType
                    receiverPlayer {
                        id
                        nickname
                    }
                    secondIncompletionReasonType
                    shotInitialHeightType
                    shotOutcomeType
                    targetFacingType
                    targetPlayer {
                        id
                        nickname
                    }
                    updatedAt
                }
                reboundEvent {
                    advantageType
                    blockerPlayer {
                        id
                        nickname
                    }
                    insertedAt
                    missedTouchPlayer {
                        id
                        nickname
                    }
                    missedTouchType
                    originateType
                    reboundBodyType
                    reboundHeightType
                    reboundHighPointType
                    reboundOutcomeType
                    rebounderPlayer {
                        id
                        nickname
                    }
                    shotInitialHeightType
                    shotOutcomeType
                    updatedAt
                }
                shootingEvent {
                    advantageType
                    badParry
                    ballHeightType
                    ballMoving
                    betterOptionPlayer {
                        id
                        nickname
                    }
                    betterOptionTime
                    betterOptionType
                    blockerPlayer {
                        id
                        nickname
                    }
                    bodyMovementType
                    clearerPlayer {
                        id
                        nickname
                    }
                    createsSpace
                    deflectorBodyType
                    deflectorPlayer {
                        id
                        nickname
                    }
                    failedInterventionPlayer {
                        id
                        nickname
                    }
                    failedInterventionPlayer1 {
                        id
                        nickname
                    }
                    failedInterventionPlayer2 {
                        id
                        nickname
                    }
                    failedInterventionPlayer3 {
                        id
                        nickname
                    }
                    insertedAt
                    keeperTouchType
                    missedTouchPlayer {
                        id
                        nickname
                    }
                    missedTouchType
                    noLook
                    pressurePlayer {
                        id
                        nickname
                    }
                    pressureType
                    saveHeightType
                    saveReboundType
                    saveable
                    saverPlayer {
                        id
                        nickname
                    }
                    shooterPlayer {
                        id
                        nickname
                    }
                    shotBodyType
                    shotInitialHeightType
                    shotNatureType
                    shotOutcomeType
                    shotType
                    updatedAt
                }
                fouls {
                    badCall
                    correctDecision
                    culpritPlayer {
                        id
                        nickname
                    }
                    foulOutcomeType
                    foulType
                    insertedAt
                    potentialOffenseType
                    sequence
                    updatedAt
                    var
                    varCulpritPlayer {
                        id
                        nickname
                    }
                    varOutcomeType
                    varPotentialOffenseType
                    varReasonType
                    victimPlayer {
                        id
                        nickname
                    }
                }
                grades {
                    gradeLabel
                    gradeStyle
                    gradeType
                    insertedAt
                    playerGrade
                    player {
                        id
                        nickname
                    }
                    updatedAt
                }
            }
        }
    }
}
'

variables <- paste('
{
    "id":',game_id,'
}
')

df = as.data.frame(GQL(query,variables))
return(df)
}

######################################
# Function get_roster given game_id
#####################################

get_gameEvent <- function(id) {

  query <- '
query gameEvent ($id: ID!) {
    gameEvent (id: $id) {
        advantageType
        bodyType
        duration
        earlyDistribution
        endTime
        endType
        formattedGameClock
        gameClock
        gameEventType
        heightType
        initialTouchType
        insertedAt
        otherPlayer {
            id
            nickname
        }
        outType
        player {
            id
            nickname
        }
        playerOff {
            id
            nickname
        }
        playerOffType
        playerOn {
            id
            nickname
        }
        pressurePlayer {
            id
            nickname
        }
        pressureType
        scoreValue
        setpieceType
        startTime
        subType
        team {
            id
            name
        }
        touches
        touchesInBox
        updatedAt
        videoAngleType
        video {
            id
        }
        videoMissing
        videoUrl
        defenderLocations {
            eventModule
            name
            x
            y
        }
        offenderLocations {
            eventModule
            name
            x
            y
        }
        possessionEvents {
            duration
            endTime
            formattedGameClock
            gameClock
            id
            insertedAt
            possessionEventType
            startTime
            updatedAt
            videoUrl
            ballCarryEvent {
                additionalChallenger1 {
                    id
                    nickname
                }
                additionalChallenger2 {
                    id
                    nickname
                }
                additionalChallenger3 {
                    id
                    nickname
                }
                advantageType
                ballCarrierPlayer {
                    id
                    nickname
                }
                ballCarryType
                betterOptionPlayer {
                    id
                    nickname
                }
                betterOptionTime
                betterOptionType
                carryType
                createsSpace
                defenderPlayer {
                    id
                    nickname
                }
                id
                insertedAt
                leadsToType
                linesBrokenType
                opportunityType
                pressurePlayer {
                    id
                    nickname
                }
                touchOutcomeType
                touchType
                updatedAt
            }
            challengeEvent {
                additionalChallenger1 {
                    id
                    nickname
                }
                additionalChallenger2 {
                    id
                    nickname
                }
                additionalChallenger3 {
                    id
                    nickname
                }
                advantageType
                ballCarrierPlayer {
                    id
                    nickname
                }
                betterOptionPlayer {
                    id
                    nickname
                }
                betterOptionTime
                betterOptionType
                challengeOutcomeType
                challengeType
                challengeWinnerPlayer {
                    id
                    nickname
                }
                challengerHomePlayer {
                    id
                    nickname
                }
                challengerAwayPlayer {
                    id
                    nickname
                }
                challengerPlayer {
                    id
                    nickname
                }
                createsSpace
                dribbleType
                insertedAt
                keeperPlayer {
                    id
                    nickname
                }
                linesBrokenType
                missedTouchPlayer {
                    id
                    nickname
                }
                missedTouchType
                opportunityType
                pressurePlayer {
                    id
                    nickname
                }
                tackleAttemptType
                trickType
                updatedAt
            }
            clearanceEvent {
                advantageType
                ballHeightType
                betterOptionPlayer {
                    id
                    nickname
                }
                betterOptionTime
                betterOptionType
                blockerPlayer {
                    id
                    nickname
                }
                clearanceBodyType
                clearanceOutcomeType
                clearancePlayer {
                    id
                    nickname
                }
                createsSpace
                failedInterventionPlayer {
                    id
                    nickname
                }
                failedInterventionPlayer1 {
                    id
                    nickname
                }
                failedInterventionPlayer2 {
                    id
                    nickname
                }
                failedInterventionPlayer3 {
                    id
                    nickname
                }
                insertedAt
                missedTouchPlayer {
                    id
                    nickname
                }
                missedTouchType
                opportunityType
                pressurePlayer {
                    id
                    nickname
                }
                pressureType
                shotInitialHeightType
                shotOutcomeType
                updatedAt
            }
            crossEvent {
                advantageType
                ballHeightType
                betterOptionPlayer {
                    id
                    nickname
                }
                betterOptionTime
                betterOptionType
                blockerPlayer {
                    id
                    nickname
                }
                clearerPlayer {
                    id
                    nickname
                }
                completeToPlayer {
                    id
                    nickname
                }
                createsSpace
                crossHighPointType
                crossOutcomeType
                crossType
                crossZoneType
                crosserBodyType
                crosserPlayer {
                    id
                    nickname
                }
                defenderBallHeightType
                defenderBodyType
                defenderPlayer {
                    id
                    nickname
                }
                deflectorBodyType
                deflectorPlayer {
                    id
                    nickname
                }
                failedInterventionPlayer {
                    id
                    nickname
                }
                failedInterventionPlayer1 {
                    id
                    nickname
                }
                failedInterventionPlayer2 {
                    id
                    nickname
                }
                failedInterventionPlayer3 {
                    id
                    nickname
                }
                incompletionReasonType
                insertedAt
                intendedTargetPlayer {
                    id
                    nickname
                }
                keeperPlayer {
                    id
                    nickname
                }
                missedTouchPlayer {
                    id
                    nickname
                }
                missedTouchType
                noLook
                opportunityType
                pressurePlayer {
                    id
                    nickname
                }
                pressureType
                receiverBallHeightType
                receiverBodyType
                secondIncompletionReasonType
                shotInitialHeightType
                shotOutcomeType
                updatedAt
            }
            passingEvent {
                advantageType
                ballHeightType
                betterOptionPlayer {
                    id
                    nickname
                }
                betterOptionTime
                betterOptionType
                blockerPlayer {
                    id
                    nickname
                }
                createsSpace
                defenderBodyType
                defenderHeightType
                defenderPlayer {
                    id
                    nickname
                }
                deflectorBodyType
                deflectorPlayer {
                    id
                    nickname
                }
                failedInterventionPlayer {
                    id
                    nickname
                }
                failedInterventionPlayer1 {
                    id
                    nickname
                }
                failedInterventionPlayer2 {
                    id
                    nickname
                }
                failedInterventionPlayer3 {
                    id
                    nickname
                }
                incompletionReasonType
                insertedAt
                linesBrokenType
                missedTouchPlayer {
                    id
                    nickname
                }
                missedTouchType
                noLook
                opportunityType
                passAccuracyType
                passBodyType
                passHighPointType
                passOutcomeType
                passType
                passerPlayer {
                    id
                    nickname
                }
                pressurePlayer {
                    id
                    nickname
                }
                pressureType
                receiverBodyType
                receiverFacingType
                receiverHeightType
                receiverPlayer {
                    id
                    nickname
                }
                secondIncompletionReasonType
                shotInitialHeightType
                shotOutcomeType
                targetFacingType
                targetPlayer {
                    id
                    nickname
                }
                updatedAt
            }
            reboundEvent {
                advantageType
                blockerPlayer {
                    id
                    nickname
                }
                insertedAt
                missedTouchPlayer {
                    id
                    nickname
                }
                missedTouchType
                originateType
                reboundBodyType
                reboundHeightType
                reboundHighPointType
                reboundOutcomeType
                rebounderPlayer {
                    id
                    nickname
                }
                shotInitialHeightType
                shotOutcomeType
                updatedAt
            }
            shootingEvent {
                advantageType
                badParry
                ballHeightType
                ballMoving
                betterOptionPlayer {
                    id
                    nickname
                }
                betterOptionTime
                betterOptionType
                blockerPlayer {
                    id
                    nickname
                }
                bodyMovementType
                clearerPlayer {
                    id
                    nickname
                }
                createsSpace
                deflectorBodyType
                deflectorPlayer {
                    id
                    nickname
                }
                failedInterventionPlayer {
                    id
                    nickname
                }
                failedInterventionPlayer1 {
                    id
                    nickname
                }
                failedInterventionPlayer2 {
                    id
                    nickname
                }
                failedInterventionPlayer3 {
                    id
                    nickname
                }
                insertedAt
                keeperTouchType
                missedTouchPlayer {
                    id
                    nickname
                }
                missedTouchType
                noLook
                pressurePlayer {
                    id
                    nickname
                }
                pressureType
                saveHeightType
                saveReboundType
                saveable
                saverPlayer {
                    id
                    nickname
                }
                shooterPlayer {
                    id
                    nickname
                }
                shotBodyType
                shotInitialHeightType
                shotNatureType
                shotOutcomeType
                shotType
                updatedAt
            }
            fouls {
                badCall
                correctDecision
                culpritPlayer {
                    id
                    nickname
                }
                foulOutcomeType
                foulType
                insertedAt
                potentialOffenseType
                sequence
                updatedAt
                var
                varCulpritPlayer {
                    id
                    nickname
                }
                varOutcomeType
                varPotentialOffenseType
                varReasonType
                victimPlayer {
                    id
                    nickname
                }
            }
            grades {
                gradeLabel
                gradeStyle
                gradeType
                insertedAt
                playerGrade
                player {
                    id
                    nickname
                }
                updatedAt
            }
        }
    }
}
'

variables <- paste('
{
    "id":',id,'
}
')

df = GQL(query,variables)
return(df)
}


#######################################
# Function get_ballCarryEvent given ID
######################################

get_ballCarryEvent <- function(id) {

  query <- '
query ballCarryEvent ($id: ID!) {
    ballCarryEvent (id: $id) {
        additionalChallenger1 {
            id
            nickname
        }
        additionalChallenger2 {
            id
            nickname
        }
        additionalChallenger3 {
            id
            nickname
        }
        advantageType
        ballCarrierPlayer {
            id
            nickname
        }
        ballCarryType
        betterOptionPlayer {
            id
            nickname
        }
        betterOptionTime
        betterOptionType
        carryType
        createsSpace
        defenderPlayer {
            id
            nickname
        }
        id
        insertedAt
        leadsToType
        linesBrokenType
        opportunityType
        pressurePlayer {
            id
            nickname
        }
        touchOutcomeType
        touchType
        updatedAt
    }
}
'

variables <- paste('
{
    "id":',id,'
}
')

df = GQL(query,variables)
return(df)
}


#######################################
# Function get_challengeEvent given id
#######################################

get_challengeEvent <- function(id) {

  query <- '
query challengeEvent ($id: ID!) {
    challengeEvent (id: $id) {
        additionalChallenger1 {
            id
            nickname
        }
        additionalChallenger2 {
            id
            nickname
        }
        additionalChallenger3 {
            id
            nickname
        }
        advantageType
        ballCarrierPlayer {
            id
            nickname
        }
        betterOptionPlayer {
            id
            nickname
        }
        betterOptionTime
        betterOptionType
        challengeOutcomeType
        challengeType
        challengeWinnerPlayer {
            id
            nickname
        }
        challengerHomePlayer {
            id
            nickname
        }
        challengerAwayPlayer {
            id
            nickname
        }
        challengerPlayer {
            id
            nickname
        }
        createsSpace
        dribbleType
        insertedAt
        keeperPlayer {
            id
            nickname
        }
        linesBrokenType
        missedTouchPlayer {
            id
            nickname
        }
        missedTouchType
        opportunityType
        pressurePlayer {
            id
            nickname
        }
        tackleAttemptType
        trickType
        updatedAt
    }
}
'

variables <- paste('
{
    "id":',id,'
}
')

df = GQL(query,variables)
return(df)
}

#######################################
# Function get_challengeEvent given id
#######################################

get_clearanceEvent <- function(id) {

  query <- '
query clearanceEvent ($id: ID!) {
    clearanceEvent (id: $id) {
        advantageType
        ballHeightType
        betterOptionPlayer {
            id
            nickname
        }
        betterOptionTime
        betterOptionType
        blockerPlayer {
            id
            nickname
        }
        clearanceBodyType
        clearanceOutcomeType
        clearancePlayer {
            id
            nickname
        }
        createsSpace
        failedInterventionPlayer {
            id
            nickname
        }
        insertedAt
        missedTouchPlayer {
            id
            nickname
        }
        missedTouchType
        opportunityType
        pressurePlayer {
            id
            nickname
        }
        pressureType
        shotInitialHeightType
        shotOutcomeType
        updatedAt
    }
}
'

variables <- paste('
{
    "id":',id,'
}
')

df = GQL(query,variables)
return(df)
}


#######################################
# Function get_crossEvent given id
#######################################

get_crossEvent <- function(id) {

  query <- '
query crossEvent ($id: ID!) {
    crossEvent (id: $id) {
        advantageType
        ballHeightType
        betterOptionPlayer {
            id
            nickname
        }
        betterOptionTime
        betterOptionType
        blockerPlayer {
            id
            nickname
        }
        clearerPlayer {
            id
            nickname
        }
        completeToPlayer {
            id
            nickname
        }
        createsSpace
        crossHighPointType
        crossOutcomeType
        crossType
        crossZoneType
        crosserBodyType
        crosserPlayer {
            id
            nickname
        }
        defenderBallHeightType
        defenderBodyType
        defenderPlayer {
            id
            nickname
        }
        deflectorBodyType
        deflectorPlayer {
            id
            nickname
        }
        failedInterventionPlayer {
            id
            nickname
        }
        failedInterventionPlayer1 {
            id
            nickname
        }
        failedInterventionPlayer2 {
            id
            nickname
        }
        failedInterventionPlayer3 {
            id
            nickname
        }
        incompletionReasonType
        insertedAt
        intendedTargetPlayer {
            id
            nickname
        }
        keeperPlayer {
            id
            nickname
        }
        missedTouchPlayer {
            id
            nickname
        }
        missedTouchType
        noLook
        opportunityType
        pressurePlayer {
            id
            nickname
        }
        pressureType
        receiverBallHeightType
        receiverBodyType
        secondIncompletionReasonType
        shotInitialHeightType
        shotOutcomeType
        updatedAt
    }
}
'

variables <- paste('
{
    "id":',id,'
}
')

df = GQL(query,variables)
return(df)
}


#######################################
# Function get_passingEvent given id
#######################################

get_passingEvent <- function(id) {

  query <- '
query passingEvent ($id: ID!) {
    passingEvent (id: $id) {
        advantageType
        ballHeightType
        betterOptionPlayer {
            id
            nickname
        }
        betterOptionTime
        betterOptionType
        blockerPlayer {
            id
            nickname
        }
        createsSpace
        defenderBodyType
        defenderHeightType
        defenderPlayer {
            id
            nickname
        }
        deflectorBodyType
        deflectorPlayer {
            id
            nickname
        }
        failedInterventionPlayer {
            id
            nickname
        }
        failedInterventionPlayer1 {
            id
            nickname
        }
        failedInterventionPlayer2 {
            id
            nickname
        }
        failedInterventionPlayer3 {
            id
            nickname
        }
        incompletionReasonType
        insertedAt
        linesBrokenType
        missedTouchPlayer {
            id
            nickname
        }
        missedTouchType
        noLook
        opportunityType
        passAccuracyType
        passBodyType
        passHighPointType
        passOutcomeType
        passType
        passerPlayer {
            id
            nickname
        }
        pressurePlayer {
            id
            nickname
        }
        pressureType
        receiverBodyType
        receiverFacingType
        receiverHeightType
        receiverPlayer {
            id
            nickname
        }
        secondIncompletionReasonType
        shotInitialHeightType
        shotOutcomeType
        targetFacingType
        targetPlayer {
            id
            nickname
        }
        updatedAt
    }
}
'

variables <- paste('
{
    "id":',id,'
}
')

df = GQL(query,variables)
return(df)
}


#######################################
# Function get_reboundEvent given id
#######################################

get_reboundEvent <- function(id) {

  query <- '
query reboundEvent ($id: ID!) {
    reboundEvent (id: $id) {
        advantageType
        blockerPlayer {
            id
            nickname
        }
        insertedAt
        missedTouchPlayer {
            id
            nickname
        }
        missedTouchType
        originateType
        reboundBodyType
        reboundHeightType
        reboundHighPointType
        reboundOutcomeType
        rebounderPlayer {
            id
            nickname
        }
        shotInitialHeightType
        shotOutcomeType
        updatedAt
    }
}
'

variables <- paste('
{
    "id":',id,'
}
')

df = GQL(query,variables)
return(df)
}


#######################################
# Function get_shootingEvent given id
#######################################

get_shootingEvent <- function(id) {

  query <- '
query shootingEvent ($id: ID!) {
    shootingEvent (id: $id) {
        advantageType
        badParry
        ballHeightType
        ballMoving
        betterOptionPlayer {
            id
            nickname
        }
        betterOptionTime
        betterOptionType
        blockerPlayer {
            id
            nickname
        }
        bodyMovementType
        clearerPlayer {
            id
            nickname
        }
        createsSpace
        deflectorBodyType
        deflectorPlayer {
            id
            nickname
        }
        failedInterventionPlayer {
            id
            nickname
        }
        failedInterventionPlayer1 {
            id
            nickname
        }
        failedInterventionPlayer2 {
            id
            nickname
        }
        failedInterventionPlayer3 {
            id
            nickname
        }
        insertedAt
        keeperTouchType
        missedTouchPlayer {
            id
            nickname
        }
        missedTouchType
        noLook
        pressurePlayer {
            id
            nickname
        }
        pressureType
        saveHeightType
        saveReboundType
        saveable
        saverPlayer {
            id
            nickname
        }
        shooterPlayer {
            id
            nickname
        }
        shotBodyType
        shotInitialHeightType
        shotNatureType
        shotOutcomeType
        shotType
        updatedAt
    }
}
'

variables <- paste('
{
    "id":',id,'
}
')

df = GQL(query,variables)
return(df)
}


#############################
# Function get_foul given id
#############################

get_foul <- function(id) {

  query <- '
query foul ($id: ID!) {
    foul (id: $id) {
        badCall
        correctDecision
        culpritPlayer {
            id
            nickname
        }
        foulOutcomeType
        foulType
        insertedAt
        potentialOffenseType
        sequence
        updatedAt
        var
        varCulpritPlayer {
            id
            nickname
        }
        varOutcomeType
        varPotentialOffenseType
        varReasonType
        victimPlayer {
            id
            nickname
        }
    }
}
'

variables <- paste('
{
    "id":',id,'
}
')

df = GQL(query,variables)
return(df)
}


#############################
# Function get_grade given id
#############################

get_grade <- function(id) {

  query <- '
query grade ($id: ID!) {
    grade (id: $id) {
        gradeLabel
        gradeStyle
        gradeType
        insertedAt
        playerGrade
        player {
            id
            nickname
        }
        updatedAt
    }
}
'

variables <- paste('
{
    "id":',id,'
}
')

df = GQL(query,variables)
return(df)
}
