#Matrix for Free Throws
#Bind the given vectors to form the matrix
FreeThrows <- rbind(KobeBryant_FT, JoeJohnson_FT, LeBronJames_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, ChrisPaul_FT, KevinDurant_FT, DerrickRose_FT, DwayneWade_FT)
#Remove vectors - we don't need them anymore
rm(KobeBryant_FT, JoeJohnson_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, LeBronJames_FT, ChrisPaul_FT, DerrickRose_FT, DwayneWade_FT, KevinDurant_FT)
#Rename the columns
colnames(FreeThrows) <- Seasons
#Rename the rows
rownames(FreeThrows) <- Players

#Check the matrix
FreeThrows

#Matrix for Free Throw Attempts
#Bind the given vectors to form the matrix
FreeThrowAttempts <- rbind(KobeBryant_FTA, JoeJohnson_FTA, LeBronJames_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, ChrisPaul_FTA, KevinDurant_FTA, DerrickRose_FTA, DwayneWade_FTA)
#Remove vectors - we don't need them anymore
rm(KobeBryant_FTA, JoeJohnson_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, LeBronJames_FTA, ChrisPaul_FTA, DerrickRose_FTA, DwayneWade_FTA, KevinDurant_FTA)
#Rename the columns
colnames(FreeThrowAttempts) <- Seasons
#Rename the rows
rownames(FreeThrowAttempts) <- Players



myplot = function(z, who=1:10) {

  matplot(t(z[who,,drop=F]), type="b", pch=15:18, col=c(1:4))
  legend("bottomleft", inset=0.01, legend = Players[who], col = c(1:4), pch = 15:18, horiz = F)
}


myplot(FreeThrows)


myplot(FreeThrowAttempts/Games)
myplot(FreeThrows/FreeThrowAttempts)
myplot((Points - FreeThrows)/FieldGoals)
