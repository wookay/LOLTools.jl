module test_loltools_datadragon

using Test
using LOLTools.DataDragon

@test DataDragon.version >= v"9.24.1"

champ = DataDragon.en_US.Champions[114]
@test champ.name == "Fiora"
spell = DataDragon.en_US.SummonerSpells[12]
@test spell.name == "Teleport"
item = DataDragon.en_US.Items[3111]
@test item.name == "Mercury's Treads"
@test item.gold == (base = 350, purchasable = true, total = 1100, sell = 770)
@test item.stats == (FlatMovementSpeedMod = 45, FlatSpellBlockMod = 25)

champ = DataDragon.ko_KR.Champions[114]
@test champ.name == "피오라"
spell = DataDragon.ko_KR.SummonerSpells[12]
@test spell.name == "순간이동"
item = DataDragon.ko_KR.Items[3111]
@test item.name == "헤르메스의 발걸음"
@test item.gold == (base = 350, purchasable = true, total = 1100, sell = 770)
@test item.stats == (FlatMovementSpeedMod = 45, FlatSpellBlockMod = 25)

end # module test_loltools_datadragon
