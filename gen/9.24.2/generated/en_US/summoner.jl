# generated
SummonerSpells = Dict{Int,NamedTuple}(
    21 => (id = "SummonerBarrier", name = "Barrier", description = "Shields your champion from 115-455 damage (depending on champion level) for 2 seconds.", tooltip = "Temporarily shields {{ f1 }} damage from your champion for 2 seconds.", maxrank = 1, cooldown = Any[180], cooldownBurn = "180", cost = Any[0], costBurn = "0", datavalues = NamedTuple(), effect = Any[nothing, Any[95], Any[20], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0]], effectBurn = Any[nothing, "95", "20", "0", "0", "0", "0", "0", "0", "0", "0"], vars = Any[], key = "21", summonerLevel = 4, modes = Any["ARAM", "FIRSTBLOOD", "TUTORIAL", "CLASSIC", "STARGUARDIAN", "GAMEMODEX", "PROJECT", "ARSR", "ASSASSINATE", "DOOMBOTSTEEMO", "ONEFORALL", "PRACTICETOOL", "URF"], costType = "No Cost", maxammo = "-1", range = Any[1200], rangeBurn = "1200", image = (full = "SummonerBarrier.png", sprite = "spell0.png", group = "spell", x = 0, y = 0, w = 48, h = 48), resource = "No Cost"),
    1 => (id = "SummonerBoost", name = "Cleanse", description = "Removes all disables (excluding suppression and airborne) and summoner spell debuffs affecting your champion and lowers the duration of incoming disables by 65% for 3 seconds.", tooltip = "Removes all disables (excluding suppression and airborne) and summoner spell debuffs affecting your champion and reduces the duration of disables by 65% for the next {{ f1 }} seconds.", maxrank = 1, cooldown = Any[210], cooldownBurn = "210", cost = Any[0], costBurn = "0", datavalues = NamedTuple(), effect = Any[nothing, Any[0.65], Any[3], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0]], effectBurn = Any[nothing, "0.65", "3", "0", "0", "0", "0", "0", "0", "0", "0"], vars = Any[(link = "@text", coeff = 3, key = "f1")], key = "1", summonerLevel = 9, modes = Any["CLASSIC", "ODIN", "TUTORIAL", "ARAM", "ASCENSION", "FIRSTBLOOD", "URF", "ARSR", "DOOMBOTSTEEMO", "PROJECT", "ONEFORALL", "GAMEMODEX", "PRACTICETOOL"], costType = "No Cost", maxammo = "-1", range = Any[200], rangeBurn = "200", image = (full = "SummonerBoost.png", sprite = "spell0.png", group = "spell", x = 48, y = 0, w = 48, h = 48), resource = "No Cost"),
    14 => (id = "SummonerDot", name = "Ignite", description = "Ignites target enemy champion, dealing 70-410 true damage (depending on champion level) over 5 seconds, grants you vision of the target, and reduces healing effects on them for the duration.", tooltip = "Ignite deals <span class=\"colorFEFCFF\">{{ f1 }}</span> true damage to target enemy champion over 5 seconds, grants you vision of the target and applies Grievous Wounds for the duration.<br /><br /><rules>(Grievous Wounds reduces healing effects by 40%. This vision does not reveal stealthed enemies.)</rules>", maxrank = 1, cooldown = Any[180], cooldownBurn = "180", cost = Any[0], costBurn = "0", datavalues = NamedTuple(), effect = Any[nothing, Any[5], Any[10], Any[4], Any[100], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0]], effectBurn = Any[nothing, "5", "10", "4", "100", "0", "0", "0", "0", "0", "0"], vars = Any[(link = "@player.level", coeff = Any[70, 90, 110, 130, 150, 170, 190, 210, 230, 250, 270, 290, 310, 330, 350, 370, 390, 410], key = "f1")], key = "14", summonerLevel = 9, modes = Any["CLASSIC", "ODIN", "TUTORIAL", "ARAM", "ASCENSION", "FIRSTBLOOD", "ASSASSINATE", "URF", "ARSR", "DOOMBOTSTEEMO", "ONEFORALL", "GAMEMODEX", "PRACTICETOOL"], costType = "No Cost", maxammo = "-1", range = Any[600], rangeBurn = "600", image = (full = "SummonerDot.png", sprite = "spell0.png", group = "spell", x = 96, y = 0, w = 48, h = 48), resource = "No Cost"),
    3 => (id = "SummonerExhaust", name = "Exhaust", description = "Exhausts target enemy champion, reducing their Movement Speed by 30%, and their damage dealt by 40% for 2.5 seconds.", tooltip = "Exhausts target enemy champion, reducing their Movement Speed by {{ f3 }}%, and their damage dealt by {{ f2 }}% for 2.5 seconds.", maxrank = 1, cooldown = Any[210], cooldownBurn = "210", cost = Any[0], costBurn = "0", datavalues = NamedTuple(), effect = Any[nothing, Any[2.5], Any[40], Any[0], Any[0], Any[30], Any[0], Any[0], Any[0], Any[0], Any[0]], effectBurn = Any[nothing, "2.5", "40", "0", "0", "30", "0", "0", "0", "0", "0"], vars = Any[], key = "3", summonerLevel = 4, modes = Any["ARAM", "TUTORIAL", "CLASSIC", "GAMEMODEX", "URF", "ARSR", "DOOMBOTSTEEMO", "ONEFORALL", "PRACTICETOOL"], costType = "No Cost", maxammo = "-1", range = Any[650], rangeBurn = "650", image = (full = "SummonerExhaust.png", sprite = "spell0.png", group = "spell", x = 144, y = 0, w = 48, h = 48), resource = "No Cost"),
    4 => (id = "SummonerFlash", name = "Flash", description = "Teleports your champion a short distance toward your cursor's location.", tooltip = "Teleports your champion a short distance toward your cursor's location.", maxrank = 1, cooldown = Any[300], cooldownBurn = "300", cost = Any[0], costBurn = "0", datavalues = NamedTuple(), effect = Any[nothing, Any[400], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0]], effectBurn = Any[nothing, "400", "0", "0", "0", "0", "0", "0", "0", "0", "0"], vars = Any[], key = "4", summonerLevel = 7, modes = Any["CLASSIC", "ODIN", "TUTORIAL", "ARAM", "ASCENSION", "FIRSTBLOOD", "ASSASSINATE", "URF", "ARSR", "DOOMBOTSTEEMO", "STARGUARDIAN", "PROJECT", "SNOWURF", "ONEFORALL", "GAMEMODEX", "PRACTICETOOL"], costType = "No Cost", maxammo = "-1", range = Any[425], rangeBurn = "425", image = (full = "SummonerFlash.png", sprite = "spell0.png", group = "spell", x = 192, y = 0, w = 48, h = 48), resource = "No Cost"),
    6 => (id = "SummonerHaste", name = "Ghost", description = "Your champion gains increased Movement Speed and can move through units for 10 seconds. Grants a maximum of 28-45% (depending on champion level) Movement Speed after accelerating for 2 seconds.", tooltip = "Your champion gains increased Movement Speed and can move through units for 10 seconds. Grants a maximum of {{ f1 }}% Movement Speed after accelerating for 2 seconds.", maxrank = 1, cooldown = Any[180], cooldownBurn = "180", cost = Any[0], costBurn = "0", datavalues = NamedTuple(), effect = Any[nothing, Any[27], Any[0], Any[2], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0]], effectBurn = Any[nothing, "27", "0", "2", "0", "0", "0", "0", "0", "0", "0"], vars = Any[(link = "@text", coeff = 27, key = "f1")], key = "6", summonerLevel = 1, modes = Any["CLASSIC", "ODIN", "TUTORIAL", "ARAM", "ASCENSION", "FIRSTBLOOD", "ASSASSINATE", "URF", "ARSR", "DOOMBOTSTEEMO", "STARGUARDIAN", "PROJECT", "ONEFORALL", "TUTORIAL_MODULE_1", "TUTORIAL_MODULE_2", "GAMEMODEX", "PRACTICETOOL"], costType = "No Cost", maxammo = "-1", range = Any[200], rangeBurn = "200", image = (full = "SummonerHaste.png", sprite = "spell0.png", group = "spell", x = 240, y = 0, w = 48, h = 48), resource = "No Cost"),
    7 => (id = "SummonerHeal", name = "Heal", description = "Restores 90-345 Health (depending on champion level) and grants 30% Movement Speed for 1 second to you and target allied champion. This healing is halved for units recently affected by Summoner Heal.", tooltip = "Restores {{ f1 }} Health and grants 30% Movement Speed for 1 second to your champion and target allied champion. This healing is halved for units recently affected by Summoner Heal.<br /><br /><span class=\"colorFFFF00\">If this spell cannot find a target, it will cast on the most wounded allied champion in range.</span>", maxrank = 1, cooldown = Any[240], cooldownBurn = "240", cost = Any[0], costBurn = "0", datavalues = NamedTuple(), effect = Any[nothing, Any[0.3], Any[75], Any[15], Any[0.5], Any[826], Any[0.5], Any[0], Any[0], Any[0], Any[0]], effectBurn = Any[nothing, "0.3", "75", "15", "0.5", "826", "0.5", "0", "0", "0", "0"], vars = Any[(link = "@player.level", coeff = Any[90, 105, 120, 135, 150, 165, 180, 195, 210, 225, 240, 255, 270, 285, 300, 315, 330, 345], key = "f1")], key = "7", summonerLevel = 1, modes = Any["ARAM", "TUTORIAL", "CLASSIC", "STARGUARDIAN", "GAMEMODEX", "TUTORIAL_MODULE_2", "URF", "ARSR", "ASSASSINATE", "DOOMBOTSTEEMO", "ONEFORALL", "PRACTICETOOL", "TUTORIAL_MODULE_1", "PROJECT"], costType = "No Cost", maxammo = "-1", range = Any[850], rangeBurn = "850", image = (full = "SummonerHeal.png", sprite = "spell0.png", group = "spell", x = 288, y = 0, w = 48, h = 48), resource = "No Cost"),
    13 => (id = "SummonerMana", name = "Clarity", description = "Restores 50% of your champion's maximum Mana. Also restores allies for 25% of their maximum Mana.", tooltip = "Restores {{ f1 }}% maximum Mana to your Champion and {{ f2 }}% to nearby allies.", maxrank = 1, cooldown = Any[240], cooldownBurn = "240", cost = Any[0], costBurn = "0", datavalues = NamedTuple(), effect = Any[nothing, Any[50], Any[25], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0]], effectBurn = Any[nothing, "50", "25", "0", "0", "0", "0", "0", "0", "0", "0"], vars = Any[(link = "@player.level", coeff = Any[190, 220, 250, 280, 310, 340, 370, 400, 430, 460, 490, 520, 550, 580, 610, 640, 670, 700], key = "f1"), (link = "@player.level", coeff = Any[95, 110, 125, 140, 155, 170, 185, 200, 215, 230, 245, 260, 275, 290, 305, 320, 335, 350], key = "f2")], key = "13", summonerLevel = 6, modes = Any["ODIN", "ARAM", "ASCENSION", "FIRSTBLOOD"], costType = "No Cost", maxammo = "-1", range = Any[600], rangeBurn = "600", image = (full = "SummonerMana.png", sprite = "spell0.png", group = "spell", x = 336, y = 0, w = 48, h = 48), resource = "No Cost"),
    30 => (id = "SummonerPoroRecall", name = "To the King!", description = "Quickly travel to the Poro King's side.", tooltip = "<span class=\"colorFFE076\">Passive:</span> Hitting an enemy champion with a Poro gives your team a Poro Mark. Upon reaching 10 Poro Marks, your team summons the Poro King to fight alongside them. While the Poro King is active, no Poro Marks can be scored by either team.<br /><br /><span class=\"colorFFE076\">Active:</span> Quickly dash to King Poro's side. Can only be cast while the Poro King is summoned for your team. <br /><br /><i><span class=\"colorFDD017\">''Poros tug the heartstrings. The rest of you just comes along for the ride.''</span></i></mainText>", maxrank = 1, cooldown = Any[10], cooldownBurn = "10", cost = Any[0], costBurn = "0", datavalues = NamedTuple(), effect = Any[nothing, Any[3000], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0]], effectBurn = Any[nothing, "3000", "0", "0", "0", "0", "0", "0", "0", "0", "0"], vars = Any[], key = "30", summonerLevel = 1, modes = Any["KINGPORO"], costType = "No Cost", maxammo = "-1", range = Any[200], rangeBurn = "200", image = (full = "SummonerPoroRecall.png", sprite = "spell0.png", group = "spell", x = 384, y = 0, w = 48, h = 48), resource = "No Cost"),
    31 => (id = "SummonerPoroThrow", name = "Poro Toss", description = "Toss a Poro at your enemies. If it hits, you can quickly travel to your target as a follow up.", tooltip = "Toss a Poro a long distance, dealing {{ f2 }} true damage to the first enemy unit hit, granting <span class=\"coloree91d7\">True Sight</span> of the target.<br /><br />This ability can be recast for 3 seconds if it hits an enemy to dash to the target hit, dealing {{ f2 }} more true damage and reducing the cooldown of the next Poro Toss by {{ e4 }} seconds.<br /><br />Poros are not blocked by spell shields or wind walls because they are animals, not spells!<br /><br /><i><span class=\"colorFDD017\">''Poros are a model for Runeterran aerodynamics.''</span></i></mainText>", maxrank = 1, cooldown = Any[20], cooldownBurn = "20", cost = Any[0], costBurn = "0", datavalues = NamedTuple(), effect = Any[nothing, Any[20], Any[10], Any[3], Any[5], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0]], effectBurn = Any[nothing, "20", "10", "3", "5", "0", "0", "0", "0", "0", "0"], vars = Any[], key = "31", summonerLevel = 1, modes = Any["KINGPORO"], costType = "No Cost", maxammo = "-1", range = Any[2500], rangeBurn = "2500", image = (full = "SummonerPoroThrow.png", sprite = "spell0.png", group = "spell", x = 432, y = 0, w = 48, h = 48), resource = "No Cost"),
    11 => (id = "SummonerSmite", name = "Smite", description = "Deals 390-1000 true damage (depending on champion level) to target epic, large, or medium monster or enemy minion. Restores Health based on your maximum life when used against monsters.", tooltip = "Deals <span class=\"colorFEFCFF\">{{ f1 }}</span> true damage to target epic, large, or medium monster or enemy minion.  Against monsters, additionally restores <span class=\"colorFFFFFF\">{{ f6 }}</span> <span class=\"colorFF6666\">(+{{ f7 }})</span> Health.<br /><br />Smite regains a charge every {{ ammorechargetime }} seconds, up to a maximum of 2 charges.", maxrank = 1, cooldown = Any[15], cooldownBurn = "15", cost = Any[0], costBurn = "0", datavalues = NamedTuple(), effect = Any[nothing, Any[15], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0]], effectBurn = Any[nothing, "15", "0", "0", "0", "0", "0", "0", "0", "0", "0"], vars = Any[(link = "@player.level", coeff = Any[390, 410, 430, 450, 480, 510, 540, 570, 600, 640, 680, 720, 760, 800, 850, 900, 950, 1000], key = "f1")], key = "11", summonerLevel = 9, modes = Any["URF", "CLASSIC", "ARSR", "DOOMBOTSTEEMO", "ONEFORALL", "PRACTICETOOL", "TUTORIAL", "GAMEMODEX"], costType = "No Cost", maxammo = "2", range = Any[500], rangeBurn = "500", image = (full = "SummonerSmite.png", sprite = "spell0.png", group = "spell", x = 0, y = 48, w = 48, h = 48), resource = "No Cost"),
    39 => (id = "SummonerSnowURFSnowball_Mark", name = "Mark", description = "Throw a snowball in a straight line at your enemies. If it hits an enemy, they become marked, granting True Sight, and your champion can quickly travel to the marked target as a follow up.", tooltip = "Throw a snowball a long distance, dealing {{ f1 }} true damage to the first enemy unit hit and granting <span class=\"coloree91d7\">True Sight</span> of the target. If it hits an enemy, this ability can be recast for {{ e3 }} seconds to Dash to the tagged unit, dealing an additional {{ f1 }} true damage. Dashing to the target will reduce the cooldown of Mark by {{ e4 }}%.<br /><br /><span class=\"colorFFFF00\">Mark projectiles are not stopped by spell shields or projectile mitigation.</span>", maxrank = 1, cooldown = Any[80], cooldownBurn = "80", cost = Any[0], costBurn = "0", datavalues = NamedTuple(), effect = Any[nothing, Any[10], Any[5], Any[3], Any[25], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0]], effectBurn = Any[nothing, "10", "5", "3", "25", "0", "0", "0", "0", "0", "0"], vars = Any[], key = "39", summonerLevel = 6, modes = Any["SNOWURF"], costType = "No Cost", maxammo = "-1", range = Any[8000], rangeBurn = "8000", image = (full = "SummonerSnowURFSnowball_Mark.png", sprite = "spell0.png", group = "spell", x = 48, y = 48, w = 48, h = 48), resource = "No Cost"),
    32 => (id = "SummonerSnowball", name = "Mark", description = "Throw a snowball in a straight line at your enemies. If it hits an enemy, they become marked, granting True Sight, and your champion can quickly travel to the marked target as a follow up.", tooltip = "Throw a snowball a long distance, dealing {{ f1 }} true damage to the first enemy unit hit and granting <span class=\"coloree91d7\">True Sight</span> of the target. If it hits an enemy, this ability can be recast for {{ e3 }} seconds to Dash to the tagged unit, dealing an additional {{ f1 }} true damage. Dashing to the target will reduce the cooldown of Mark by {{ e4 }}%.<br /><br /><span class=\"colorFFFF00\">Mark projectiles are not stopped by spell shields or projectile mitigation.</span>", maxrank = 1, cooldown = Any[80], cooldownBurn = "80", cost = Any[0], costBurn = "0", datavalues = NamedTuple(), effect = Any[nothing, Any[10], Any[5], Any[3], Any[25], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0]], effectBurn = Any[nothing, "10", "5", "3", "25", "0", "0", "0", "0", "0", "0"], vars = Any[], key = "32", summonerLevel = 6, modes = Any["ARAM", "FIRSTBLOOD"], costType = "No Cost", maxammo = "-1", range = Any[1600], rangeBurn = "1600", image = (full = "SummonerSnowball.png", sprite = "spell0.png", group = "spell", x = 96, y = 48, w = 48, h = 48), resource = "No Cost"),
    12 => (id = "SummonerTeleport", name = "Teleport", description = "After channeling for 4 seconds, teleports your champion to target allied structure, minion, or ward.", tooltip = "After channeling for {{ f1 }} seconds, your champion teleports to target allied structure, minion, or ward.", maxrank = 1, cooldown = Any[360], cooldownBurn = "360", cost = Any[0], costBurn = "0", datavalues = NamedTuple(), effect = Any[nothing, Any[4], Any[240], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0], Any[0]], effectBurn = Any[nothing, "4", "240", "0", "0", "0", "0", "0", "0", "0", "0"], vars = Any[(link = "@text", coeff = 4, key = "f1")], key = "12", summonerLevel = 7, modes = Any["CLASSIC", "TUTORIAL", "ASSASSINATE", "ARSR", "DOOMBOTSTEEMO", "ONEFORALL", "PRACTICETOOL", "GAMEMODEX"], costType = "No Cost", maxammo = "-1", range = Any[25000], rangeBurn = "25000", image = (full = "SummonerTeleport.png", sprite = "spell0.png", group = "spell", x = 144, y = 48, w = 48, h = 48), resource = "No Cost"),
)
