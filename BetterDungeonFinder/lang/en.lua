local BAF = BetterDungonFinder
--[[
For translation, you have to copy this file and rename it in xx.lua, and translated the strings below. 
you can get the xx for your language by typing following line in game chat
/script d(GetCVar("language.2"))
]]

--[[
If the font size of dungeon in your language is ok, let it empty.
you can set it with my pre-made settings.
"BAFWinH3"  20KB size
"BAFWinH4"  18KB size default setting
"BAFWinH5"  15KB size

Or you can define your own font.
Take a look at https://wiki.esoui.com/Fonts

For example:
local MyFont = string.format(
      "$(%s)|$(KB_%s)|%s",    --you don't need to understand this
      fontStyle,              --like "MEDIUM_FONT" (it's more complex to use other fonts not provided by eso)
      fontSize,               --like 12
      fontWeight              --like "soft-shadow-thin"
    )
BAFFontSize = MyFont
]]

BAFFontSize = ""

--String Used in addon.
BAFLang_SI = {
  FirstTime = "[BetterDungeonFinder] First Time Loading\r\n- Use the Enter key to call up the mouse to drag |t30:30:esoui/art/lfg/lfg_indexicon_dungeon_up.dds|t\r\n- Set a shortcut key for BDF in Control (Optional)\r\n- Check out the setting menu for more BDF options",
  
  TITLE = "Better Dungeon Finder",
  TITLE_BaseDungeon = "Base Dungeons",
  TITLE_DLCDungeon = "DLC Dungeons",
  TITLE_Undauted = "Undaunted Pledges", 
  
  Caption_SK = "Skill Point",
  Caption_HM = "HM",
  Caption_SR = "SR",
  Caption_ND = "ND",
  Caption_TR = "Trifecta",
  
  BUTTON_Empty = "Empty",
  BUTTON_Empty_Clear = "Empty (0)",
  
  BUTTON_N_Info = "|cFFD700"..GetString(SI_DUNGEONDIFFICULTY1).."|r\r\n(LMB) Select\r\n(RMB) Fast Travel",
  BUTTON_V_Info = "|cFFD700"..GetString(SI_DUNGEONDIFFICULTY2).."|r\r\n(LMB) Select\r\n(RMB) Fast Travel",
  BUTTON_Sky_Info = "(Double-Click) Select All Skill Points",
  
  BUTTON_Queue_Status_Queue = "Queue!",
  BUTTON_Queue_Status_Cancel = "Cancel",
  BUTTON_Queue_Status_Ready = "Ready?",
  BUTTON_Queue_Status_Fight = "Fighting",
  BUTTON_BG_Tooltip = "(LMB) 4v4   (RMB) 8v8",
  
  DIALOG_TITLE = "[BDF] Save Dungeon List",
  DIALOG_TEXT = "Enter a new name for the list",
  
  SETTING_Finder_Header = "Dungeon Finder",
  SETTING_Finder_Lock = "Lock Dungeon Finder",
  SETTING_Finder_Lock_Info = "Lock the position of Dungeon Finder",
  SETTING_Finder_Pure = "Pure Black Background",
  SETTING_Finder_Pure_Info = "Set Background of Finder to Pure Black",
  SETTING_Finder_Title = "Left Aligned Dungeon Titles",
  SETTING_Finder_Title_Info = "Defaults to centered display",
  SETTING_Finder_TitleV = "Position Adjustment for Dungeon Titles",
  SETTING_Finder_Alpha_Low = "Dungeon Image Opacity (unselected)",
  SETTING_Finder_Alpha_High = "Dungeon Image Opacity (selected)",
  SETTING_Finder_Alpha_Tooltip = "No - 0 ~ 1 - Full",
  
  SETTING_Trigger_Header = "Triggle Button",
  SETTING_Trigger_Lock = "Lock Triggle Button",
  SETTING_Trigger_Lock_Info = "Lock the Position of Triggle Button",
  SETTING_Trigger_Hide = "Hide Triggle Button",
  SETTING_Trigger_Hide_Info = "Hide the Triggle Button",
  
  SETTING_Other_Header = "Other Functions",
  SETTING_Other_AutoUDQ = "Automatic Handover of Undaunted Quests",
  SETTING_Other_AutoUDQ_Info = "Automatically pickup or submit undaunted quests when interacting with NPCs",
  SETTING_Other_AutoUDQ_Delay = "Interact Delay (ms)",
  SETTING_Other_AutoSwitchQuest = "Switch Quest in Undauted Dungeons",
  SETTING_Other_AutoSwitchQuest_Info = "Automatically track the undauted quests in dungeons for info",
  SETTING_Other_MarkChests = "Automatically mark possible locations of chests in dungeons",
  SETTING_Other_MarkChests_Info = "Require OdySupportIcons\r\n(Experimental function) similar to HarvestMap, you have to open the chest at least once",
  SETTING_Other_ShareChests = "Share Possible Locations of Dungeon Chests",
  SETTING_Other_ShareChests_Info = "When the first time out of combat in dungeons, attempt to share the possible location of that dungeon's chests with your members \r\nBoth sides need BDF, OdySupportIcons and LibDataShare",
  SETTING_Other_AutoConfirm = "Auto-Confirmation with x Seconds Remaining",
  SETTING_Other_BGSound = "Temporary Permission for Background Audio",
  SETTING_Other_BGSound_Info = "Temporarily allow the game to play audio in the background during the countdown to ready confirmation",
  
  SETTING_Sort_Header = "Customized Dungeon Sorting",
  SETTING_Sort_AZ_Info = "Alphabetical, same order as official",
  
  KEYBIND = "Open/Close BDF",
  
  WARNING_ChangRole = "[BDF] Not Now.",
  WARNING_NoSelect = "[BDF] NO Dungeon Selected.",
  WARNING_Difficulty = "[BDF] Unable to Change Difficulty Now.",
  WARNING_ReloadUI = "Need to reload the UI.",
  
  MESSAGE_AddChestMark = "[BDF] Added a refresh point of chest",
  MESSAGE_ReceivedChest = "[BDF] Received <<1>> refresh points of chest from <<2>>"
}
--Waring: Every line in BAFLang_SI should be ended with ,