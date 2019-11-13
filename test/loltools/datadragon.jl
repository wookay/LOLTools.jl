module test_loltools_datadragon

using Test
using LOLTools.DataDragon

champ = DataDragon.Champions[126]
@test champ.name == "Jayce"

champ = DataDragon.Champions[13]
@test champ.name == "Ryze"

champ = DataDragon.Champions[114]
@test champ.name == "Fiora"

end # module test_loltools_datadragon
