--Namespace
BetterDungonFinder = {}
local BAF = BetterDungonFinder

BAF.name = "BetterDungeonFinder"
BAF.title = "BetterDungeonFinder"
BAF.author = "@MelanAster"
BAF.version = "1.61"

--01, Normal activityId
--02, Vertern activityId
--03, Zone Id
--04, SetsId Table
--05, HM AchievementId
--06, SR AchievementId
--07, ND AchievementId
--08, Tri AchievementID
--09, SkillPoint QuestId
--10, Undaunted QuestId
--11, Undaunted weapon style PackId
--12, Dungeon Style master achievement
--13, Fast Travel Node Index
BAF.BaseDungeonInfo = {
  [1] =  {4,   20,  380, {265, 197, 110, 295, 170}, 1554, 1552, 1553, nil, 4107, 5244, 6218, nil, 198}, -- The Banished Cells I
  [2] =  {300, 301, 935, {265, 197, 110, 295, 170}, 451,  449,  1564, nil, 4597, 5246, 9137, nil, 262}, -- The Banished Cells II
  [3] =  {2,   299, 283, {266, 162, 33,  61,  297}, 1561, 1559, 1560, nil, 3993, 5247, 8423, nil,  98}, -- Fungal Grotto I
  [4] =  {18,  312, 934, {266, 162, 33,  61,  297}, 342,  340,  1563, nil, 4303, 5248, 7836, nil, 266}, -- Fungal Grotto II
  [5] =  {3,   315, 144, {163, 267, 296, 55,  35},  1570, 1568, 1569, nil, 4054, 5260, 6779, nil, 193}, -- Spindleclutch I
  [6] =  {316, 19,  936, {163, 267, 296, 55,  35},  448,  446,  1572, nil, 4555, 5273, 6772, nil, 267}, -- Spindleclutch II
  [7] =  {5,   309, 63,  {166, 268, 301, 300, 96},  1586, 1584, 1585, nil, 4145, 5274, 8438, nil, 198}, -- Darkshade Caverns I
  [8] =  {308, 21,  930, {166, 268, 301, 300, 96},  467,  465,  1588, nil, 4641, 5275, 7160, nil, 264}, -- Darkshade Caverns II
  [9] =  {7,   23,  126, {269, 167, 298, 155, 28},  1578, 1576, 1577, nil, 4336, 5276, 7842, nil, 191}, -- Elden Hollow I
  [10] = {303, 302, 931, {269, 167, 298, 155, 28},  463,  461,  1580, nil, 4675, 5277, 7166, nil, 265}, -- Elden Hollow II
  [11] = {6,   306, 146, {165, 270, 29,  194, 299}, 1594, 1592, 1593, nil, 4246, 5278, 7848, nil, 189}, -- Wayrest Sewers I
  [12] = {22,  307, 933, {165, 270, 29,  194, 299}, 681,  679,  1596, nil, 4813, 5282, 8821, nil, 263}, -- Wayrest Sewers II
  [13] = {8,   305, 148, {156, 304, 303, 271},      1609, 1607, 1608, nil, 4202, 5288, 6786, nil, 192}, -- Arx Corinium
  [14] = {10,  310, 176, {160, 272, 158, 159, 169}, 1602, 1600, 1601, nil, 4778, 5290, 8429, nil, 197}, -- City of Ash I
  [15] = {322, 267, 681, {160, 272, 158, 159, 169}, 1114, 1108, 1107, nil, 5120, 5381, 7154, nil, 268}, -- City of Ash II
  [16] = {9,   261, 130, {273, 122, 134, 302, 168}, 1615, 1613, 1614, nil, 4379, 5283, 6216, nil, 190}, -- Crypt of Hearts I
  [17] = {317, 318, 932, {273, 122, 134, 302, 168}, 1084, 941,  942,  nil, 5113, 5284, 8891, nil, 269}, -- Crypt of Hearts II
  [18] = {11,  319, 449, {274, 307, 53,  103},      1628, 1626, 1627, nil, 4346, 5291, 6342, nil, 195}, -- Direfrost Keep
  [19] = {13,  311, 131, {188, 193, 186, 275},      1622, 1620, 1621, nil, 4538, 5301, 8589, nil, 188}, -- Tempest Island
  [20] = {12,  304, 22,  {276, 77,  102, 305},      1634, 1632, 1633, nil, 4432, 5303, 9447, nil, 196}, -- Volenfell
  [21] = {15,  321, 38,  {308, 277, 157, 309},      1652, 1650, 1651, nil, 4589, 5305, 7830, nil, 186}, -- Blackheart Haven
  [22] = {14,  320, 64,  {72,  310, 46,  278},      1646, 1644, 1645, nil, 4469, 5306, 6369, nil, 187}, -- Blessed Crucible
  [23] = {16,  313, 31,  {279, 123, 71,  19},       1640, 1638, 1639, nil, 4733, 5307, 9561, nil, 185}, -- Selene's Web
  [24] = {17,  314, 11,  {280, 91,  124, 311},      1658, 1656, 1657, nil, 4822, 5309, 6321, nil, 184}, -- Vaults of Madness
}
BAF.DLCDungeonInfo = {
  [1]  = {288, 287, 688,  {184, 185, 198, 183}, 1279, 1275, 1276, nil,  5342, 5431, 6214,  nil , 247}, -- White-Gold Tower
  [2]  = {289, 268, 678,  {195, 196, 190, 164}, 1303, 1128, 1129, nil,  5136, 5382, 7663,  nil , 236}, -- Imperial City Prison
  [3]  = {293, 294, 843,  {256, 258, 259, 260}, 1506, 1507, 1508, nil,  5403, 5636, 7657,  1795, 260}, -- Ruins of Mazzatun
  [4]  = {295, 296, 848,  {257, 261, 262, 263}, 1524, 1525, 1526, nil,  5702, 5780, 7651,  1796, 261}, -- Cradle of Shadows
  [5]  = {324, 325, 973,  {340, 341, 338, 339}, 1696, 1694, 1695, nil,  5889, 6053, 9441,  2098, 326}, -- Bloodroot Forge
  [6]  = {368, 369, 974,  {336, 337, 342, 335}, 1704, 1702, 1703, nil,  5891, 6054, 8861,  2097, 332}, -- Falkreath Hold
  [7]  = {418, 419, 1010, {348, 350, 346, 347}, 1981, 1979, 1980, 1983, 6065, 6154, 9831,  2189, 363}, -- Scalecaller Peak
  [8]  = {420, 421, 1009, {344, 345, 349, 343}, 1965, 1963, 1964, 2102, 6064, 6155, 9792,  2190, 341}, -- Fang Lair
  [9]  = {426, 427, 1052, {404, 398, 402, 403}, 2154, 2155, 2156, 2159, 6186, 6187, 9786,  2318, 371}, -- Moon Hunter Keep
  [10] = {428, 429, 1055, {400, 397, 401, 399}, 2164, 2165, 2166, 2168, 6188, 6189, 8675,  2317, 370}, -- March of Sacrifices
  [11] = {433, 434, 1080, {432, 429, 430, 431}, 2262, 2263, 2264, 2267, 6249, 6250, 10041, 2503, 389}, -- Frostvault
  [12] = {435, 436, 1081, {436, 433, 434, 435}, 2272, 2273, 2274, 2276, 6251, 6252, 10025, 2504, 390}, -- Depths of Malatar
  [13] = {494, 495, 1122, {458, 452, 453, 454}, 2417, 2418, 2419, 2422, 6349, 6350, 10118, 2628, 391}, -- Moongrave Fane
  [14] = {496, 497, 1123, {456, 457, 459, 455}, 2427, 2428, 2429, 2431, 6351, 6352, 10212, 2629, 398}, -- Lair of Maarselok
  [15] = {503, 504, 1152, {472, 473, 478, 471}, 2541, 2542, 2543, 2546, 6414, 6415, 10206, 2747, 424}, -- Icereach
  [16] = {505, 506, 1153, {476, 479, 474, 475}, 2551, 2552, 2553, 2555, 6416, 6417, 10200, 2749, 425}, -- Unhallowed Grave
  [17] = {507, 508, 1197, {516, 517, 518, 534}, 2755, 2697, 2698, 2701, 6505, 6506, nil,   2850, 435}, -- Stone Garden
  [18] = {509, 510, 1201, {535, 513, 514, 515}, 2706, 2707, 2708, 2710, 6507, 6508, 10931, 2849, 436}, -- Castle Thorn
  [19] = {591, 592, 1228, {569, 570, 571, 577}, 2833, 2834, 2835, 2838, 6576, 6577, 11582, 2984, 437}, -- Black Drake Villa
  [20] = {593, 594, 1229, {572, 573, 574, 578}, 2843, 2844, 2845, 2847, 6578, 6579, 10559, 2991, 454}, -- The Cauldron
  [21] = {595, 596, 1267, {608, 605, 606, 607}, 3018, 3019, 3020, 3023, 6683, 6684, 10603, 3097, 470}, -- Red Petal Bastion
  [22] = {597, 598, 1268, {604, 609, 602, 603}, 3028, 3029, 3030, 3032, 6685, 6686, 10613, 3094, 469}, -- The Dread Cellar
  [23] = {599, 600, 1301, {632, 619, 620, 621}, 3153, 3107, 3108, 3111, 6740, 6741, 10937, 3229, 497}, -- Coral Aerie
  [24] = {601, 602, 1302, {624, 633, 622, 623}, 3154, 3117, 3118, 3120, 6742, 6743, 10943, 3228, 498}, -- Shipwright's Regret
  [25] = {608, 609, 1360, {660, 661, 662, 666}, 3377, 3378, 3379, 3381, 6835, 6836, 11824, 3422, 520}, -- Earthen Root Enclave
  [26] = {610, 611, 1361, {664, 665, 667, 663}, 3396, 3397, 3398, 3400, 6837, 6838, 11830, 3423, 521}, -- Graven Deep
  [27] = {613, 614, 1389, {680, 681, 682, 683}, 3470, 3471, 3472, 3474, 6896, 6897, 14546, 3547, 531}, -- Bal Sunnar
  [28] = {615, 616, 1390, {684, 685, 686, 687}, 3531, 3532, 3533, 3535, 7027, 7028, nil,   3546, 532}, -- Scrivener's Hall
  [29] = {638, 639, 1470, {732, 734, 730, 731}, 3812, 3813, 3814, 3816, 7105, 7106, nil,   3921, 556}, -- Oathsworn Pit
  [30] = {640, 641, 1471, {736, 737, 738, 735}, 3853, 3854, 3855, 3857, 7155, 7156, 13229, 3922, 565}, -- Bedlam Veil
}
--You can customize the index of dungeon by switch the index number in []

--The status of dungeons of player
BAF.BD = {
--[[
  [Index] = {
  --Constant
    ["Raw"] = table DungeonInfo[Index]
    ["Name"] = String
    ["nId"] = Number
    ["vId"] = Number
    ["zoneId"] = Number
    ["Style"] = Number
  --Variable
    ["Availability"] = Number 0 none, 1 norma, 2 both
    ["Gear"] = Table {NumGet, NumTotal}
    ["HM"] = Number 0 false, 1 true
    ["SR"] = Number 0 false, 1 true
    ["ND"] = Number 0 false, 1 true
    ["Tri"] = Number 0 not get, 1 get, 2 not exist
  --Other variable
    ["SK"] = boolen
    ["IsGetUQ"] = boolen
    ["IsTodayU"] = boolen
    ["IsRich"] = boolen
  }
]]
}

BAF.DD = {}  --DLC dungeon
BAF.UD = {}  --Dungeon match the journal quests

BAF.SD = {} -- Selected dungeon

--The controls created to UI
BAF.BDC = {}
BAF.DDC = {}
BAF.UDC = {}

--Area for UDQ
BAF.UDRange = {
  [19]  = {231282, 241735, 234151, 245884},
  [57]  = {195078, 242561, 198653, 245926},
  [383] = {239320, 238002, 242507, 240885},
}

--Alert Type
BAF.AlertSound = {
  [0] = "",
  [1] = "Enchanting_PotencyRune_Removed",
  [2] = "Achievement_Awarded",
  [3] = "Quest_Abandon",
  [4] = "Inventory_DestroyJunk",
  [5] = "InventoryItem_Repair",
  [6] = "AlliancePoint_Transact",
  [7] = "Telvar_Transact",
  [8] = "Undaunted_Transact",
  [9] = "Group_Kick",
  [10] = "LFG_Search_Started",
  [11] = "LFG_Search_Finished",
  [12] = "BG_VictoryNear",
  [13] = "Ability_Ultimate_Ready_Sound",
  [14] = "Book_Acquired",
  [15] = "Tutorial_Window_Show",
  [16] = "Stats_Purchase",
  [17] = "Smithing_Start_Research",
  [18] = "LevelUpReward_Claim",
  [19] = "CodeRedemption_Success",
  [20] = "Endeavor_Complete",
}