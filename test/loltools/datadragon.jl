module test_loltools_datadragon

using Test
using LOLTools.DataDragon

@test DataDragon.version == v"9.23.1"

champ = DataDragon.en_US.Champions[126]
@test champ.name == "Jayce"

champ = DataDragon.en_US.Champions[13]
@test champ.name == "Ryze"

champ = DataDragon.en_US.Champions[114]
@test champ.name == "Fiora"

champ = DataDragon.ko_KR.Champions[126]
@test champ.name == "제이스"

champ = DataDragon.ko_KR.Champions[13]
@test champ.name == "라이즈"

champ = DataDragon.ko_KR.Champions[114]
@test champ.name == "피오라"

end # module test_loltools_datadragon
