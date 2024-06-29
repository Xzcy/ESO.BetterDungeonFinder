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

--The alpha degree of dungeon BG when choosen or not
BAF.AlphaLow = 0.2
BAF.AlphaHigh = 0.9

--String Used in addon.
BAFLang_SI = {
  FirstTime = "[BetterDungeonFinder] First Time Loading\r\n- Use the Enter key to call up the mouse to drag |t30:30:esoui/art/lfg/lfg_indexicon_dungeon_up.dds|t\r\n- Set a shortcut key for BDF in Control (Optional)\r\n- Check out the setting menu for more BDF options",
  
  TITLE = "Better Dungeon Finder",
  TITLE_BaseDungeon = "Base Dungeons (n/v)",
  TITLE_DLCDungeon = "DLC Dungeons (n/v)",
  TITLE_Undauted = "Undaunted Pledges", 
  
  Caption_SK = "Skill Point",
  Caption_HM = "HM",
  Caption_SR = "SR",
  Caption_ND = "ND",
  Caption_TR = "Trifecta",
  
  BUTTON_Empty = "Empty",
  BUTTON_Empty_Clear = "Empty(0)",
  
  BUTTON_Queue_Status_Queue = "Queue!",
  BUTTON_Queue_Status_Cancel = "Cancel",
  BUTTON_Queue_Status_Ready = "Ready?",
  BUTTON_Queue_Status_Fight = "Fighting",
  
  SETTING_Finder_Header = "Dungeon Finder",
  SETTING_Finder_Lock = "Lock Dungeon Finder",
  SETTING_Finder_Lock_Info = "Lock the position of Dungeon Finder",
  SETTING_Finder_Pure = "Pure Black Background",
  SETTING_Finder_Pure_Info = "Set Background of Finder to Pure Black",
  SETTING_Finder_Title = "Left Aligned Dungeon Titles",
  SETTING_Finder_Title_Info = "Defaults to centered display",
  SETTING_Finder_TitleV = "Position Adjustment for Dungeon Titles",
  
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
  SETTING_Other_AutoConfirm = "Auto-Confirmation with x Seconds Remaining",
  SETTING_Other_BGSound = "Temporary Permission for Background Audio",
  SETTING_Other_BGSound_Info = "Temporarily allow the game to play audio in the background during the countdown to ready confirmation",
  
  KEYBIND = "Open/Close BDF",
  
  WARNING_ChangRole = "[BDF] Not Now.",
  WARNING_NoSelect = "[BDF] NO Dungeon Selected.",
  WARNING_ReloadUI = "Need to reload the UI.",
}
--Waring: Every line in BAFLang_SI should be ended with ,