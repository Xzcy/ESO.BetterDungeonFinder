----------------------------
local BAF = BetterDungonFinder
--Regular LibAddonMenu work
local LAM = LibAddonMenu2
----------------------------
--Tool Function
local BDSelect = ""
local DDSelect = ""

local function DungeonName(IsDlC)
  local Tep = {}
  if not IsDlC then
    for i = 1, #BAF.BaseDungeonInfo do
      Tep[i] = GetActivityName(BAF.BaseDungeonInfo[i][1])
    end
  else
    for i = 1, #BAF.DLCDungeonInfo do
      Tep[i] = GetActivityName(BAF.DLCDungeonInfo[i][1])
    end
  end
  return Tep
end

local RawBD = {unpack(BAF.BaseDungeonInfo)}
local RawDD = {unpack(BAF.DLCDungeonInfo)}
local function DungeonList(IsDLC)
  local String = ""
  if not IsDLC then
    for i = 1, #RawBD do
      String = String..GetActivityName(RawBD[BAF.savedVariables.BDSort[i]][1]).."\r\n"
    end
  else
    for i = 1, #RawDD do
      String = String..GetActivityName(RawDD[BAF.savedVariables.DDSort[i]][1]).."\r\n"
    end
  end
  return String
end

local function DungeonSwitch(IsDLC, IsDown)
  local String, Raw, Target
  if not IsDLC then
    String = BDSelect
    if String == "" then return end
    Raw = RawBD
    Target = BAF.savedVariables.BDSort
  else
    String = DDSelect
    if String == "" then return end
    Raw = RawDD
    Target = BAF.savedVariables.DDSort
  end
  local Num = 0
  local index = 0
  for i = 1, #Raw do
    if String == GetActivityName(Raw[i][1]) then 
      Num = i
      break
    end
  end
  for i = 1, #Target do
    if Num == Target[i] then
      index = i
      break
    end
  end
  if IsDown then
    if Target[index + 1] then
      Target[index], Target[index + 1] = Target[index + 1], Target[index]
    end
  else
    if Target[index - 1] then
      Target[index], Target[index - 1] = Target[index - 1], Target[index]
    end
  end
  return
end

local function DungeonNameSort(IsDLC)
  local Raw, Tep, Re
  if IsDLC then
    Raw = RawDD
  else
    Raw = RawBD
  end
  Tep = {}
  for i = 1, #Raw do
    table.insert(Tep, {["String"] = GetActivityName(Raw[i][1]), ["Index"] = i})
  end
  table.sort(Tep, function(a, b)
      return a.String < b.String
    end)
  Re = {}
  for i = 1, #Raw do
    Re[i] = Tep[i]["Index"]
  end
  return Re
end
----------------------------
--Menu
function BAF.buildMenu()
  local panelData = {
    type = "panel",
    name = BAF.name,
    displayName = BAF.title,
    author = BAF.author,
    version = BAF.version,
	}
	LAM:RegisterAddonPanel(BAF.name.."_Options", panelData)

	local options = {
    {
			type = "header",
			name = BAFLang_SI.SETTING_Finder_Header,
		},
    {
			type = "checkbox",
			name = BAFLang_SI.SETTING_Finder_Lock,
			tooltip = BAFLang_SI.SETTING_Finder_Lock_Info,
			getFunc = function() return BAF.savedVariables.Window_Lock end,
			setFunc = function(value) 
        BAF.savedVariables.Window_Lock = value
        BAF.SettingUpdate()
      end,
		},
    {
			type = "checkbox",
			name = BAFLang_SI.SETTING_Finder_Pure,
			tooltip = BAFLang_SI.SETTING_Finder_Pure_Info,
			getFunc = function() return BAF.savedVariables.Pure_Black end,
			setFunc = function(value) 
        BAF.savedVariables.Pure_Black = value
        BAF.SettingUpdate()
      end,
		},
    {
			type = "checkbox",
			name = BAFLang_SI.SETTING_Finder_Title,
			tooltip = BAFLang_SI.SETTING_Finder_Title_Info,
			getFunc = function() return BAF.savedVariables.Window_Left end,
			setFunc = function(value) 
        BAF.savedVariables.Window_Left = value
      end,
		},
    {
      type = "slider",
      name = BAFLang_SI.SETTING_Finder_TitleV,
      getFunc = function() return BAF.savedVariables.Window_LeftV end,
      setFunc = function(var) BAF.savedVariables.Window_LeftV = var end,
      min = -50,
      max = 50,
      step = 0.5,
    },
    {
      type = "slider",
      name = BAFLang_SI.SETTING_Finder_Alpha_Low,
      getFunc = function() return BAF.savedVariables.AlphaLow end,
      setFunc = function(var) BAF.savedVariables.AlphaLow = var end,
      min = 0,
      max = 1,
      step = 0.05,
      width = "half",
      tooltip = SETTING_Finder_Alpha_Tooltip,
    },
    {
      type = "slider",
      name = BAFLang_SI.SETTING_Finder_Alpha_High,
      getFunc = function() return BAF.savedVariables.AlphaHigh end,
      setFunc = function(var) BAF.savedVariables.AlphaHigh = var end,
      min = 0,
      max = 1,
      step = 0.05,
      width = "half",
      tooltip = SETTING_Finder_Alpha_Tooltip,
    },
    {
			type = "header",
			name = BAFLang_SI.SETTING_Trigger_Header,
		},
    {
			type = "checkbox",
			name = BAFLang_SI.SETTING_Trigger_Lock,
			tooltip = BAFLang_SI.SETTING_Trigger_Lock_Info,
			getFunc = function() return BAF.savedVariables.Button_Lock end,
			setFunc = function(value) 
        BAF.savedVariables.Button_Lock = value
        BAF.SettingUpdate()
      end,
		},
    {
			type = "checkbox",
			name = BAFLang_SI.SETTING_Trigger_Hide,
			tooltip = BAFLang_SI.SETTING_Trigger_Hide_Info,
			getFunc = function() return BAF.savedVariables.Button_Hide end,
			setFunc = function(value) 
        BAF.savedVariables.Button_Hide = value
        BAF.SettingUpdate()
      end,
		},
    {
			type = "header",
			name = BAFLang_SI.SETTING_Other_Header,
		},
    {
			type = "checkbox",
			name = BAFLang_SI.SETTING_Other_AutoUDQ,
			tooltip = BAFLang_SI.SETTING_Other_AutoUDQ_Info,
			getFunc = function() return BAF.savedVariables.AutoUDQ end,
			setFunc = function(value)
        BAF.savedVariables.AutoUDQ = value
      end,
		},
    {
      type = "slider",
      name = BAFLang_SI.SETTING_Other_AutoUDQ_Delay,
      getFunc = function() return BAF.savedVariables.UDQDelay end,
      setFunc = function(var) BAF.savedVariables.UDQDelay = var end,
      min = 50,
      max = 500,
      step = 10,
      width = "full",
    },
    {
			type = "checkbox",
			name = BAFLang_SI.SETTING_Other_AutoSwitchQuest,
			tooltip = BAFLang_SI.SETTING_Other_AutoSwitchQuest_Info,
			getFunc = function() return BAF.savedVariables.Auto_Switch end,
			setFunc = function(value)
        BAF.savedVariables.Auto_Switch = value
      end,
		},
    {
		type = "divider",
    alpha = 0.2,
    },
    {
      type = "slider",
      name = BAFLang_SI.SETTING_Other_AutoConfirm,
      getFunc = function() return BAF.savedVariables.AutoConfirm end,
      setFunc = function(var) BAF.savedVariables.AutoConfirm = var end,
      min = 0,
      max = 45,
      step = 3,
      warning = "0 = "..GetString(SI_DIALOG_CLOSE).."; 45 = "..GetString(SI_GAMEPAD_MARKET_FREE_TRIAL_TILE_TEXT),
    },
    {
			type = "checkbox",
			name = BAFLang_SI.SETTING_Other_BGSound,
			tooltip = BAFLang_SI.SETTING_Other_BGSound_Info,
			getFunc = function() return BAF.savedVariables.BGSound end,
			setFunc = function(value)
        BAF.savedVariables.BGSound = value
      end,
		},
    {
      type = "slider",
      name = GetString(SI_CUSTOMERSERVICESUBMITFEEDBACKSUBCATEGORIES103),
      getFunc = function() return BAF.savedVariables.AlertSound end,
      setFunc = function(var) BAF.savedVariables.AlertSound = var end,
      min = 0,
      max = 20,
      step = 1,
      width = "half",
      warning = "0 = "..GetString(SI_DIALOG_CLOSE)
    },
    {
      type = "button",
      name = "|t30:30:esoui/art/voip/gamepad/gp_voip_listening.dds|t",
      func = function()
        PlaySound(BAF.AlertSound[BAF.savedVariables.AlertSound])
      end,
      width = "half",	
    },
    {
		type = "submenu",
		name = BAFLang_SI.TITLE_BaseDungeon,
		controls = {
        {
        type = "dropdown",
        name = GetString(SI_CONSOLEACTIVITYTYPE1),
        choices = DungeonName(false),
        getFunc = function() return "" end,
        setFunc = function(var) BDSelect = var end,
        width = "full",
        warning = BAFLang_SI.WARNING_ReloadUI,
        },
        {
        type = "button",
        name = "↑",
        func = function() 
          DungeonSwitch(false, false)
          BAF_BDList.data.text = DungeonList(false)
          BAF_BDList:UpdateValue()
        end,
        width = "half",	
        },
        {
        type = "button",
        name = "↓",
        func = function() 
          DungeonSwitch(false, true)
          BAF_BDList.data.text = DungeonList(false)
          BAF_BDList:UpdateValue()
        end,
        width = "half",	
        },
        {
        type = "button",
        name = GetString(SI_GAMEPAD_BANK_SORT_ORDER_UP_TEXT),
        func = function() 
          BAF.savedVariables.BDSort = DungeonNameSort(false)
          BAF_BDList.data.text = DungeonList(false)
          BAF_BDList:UpdateValue()
        end,
        width = "half",	
        },
        {
        type = "button",
        name = GetString(SI_CHAT_CONFIG_RESET),
        func = function() 
          BAF.savedVariables.BDSort = {}
          for i = 1, #BAF.BaseDungeonInfo do
            if not BAF.savedVariables.BDSort[i] then
              BAF.savedVariables.BDSort[i] = i
            end
          end
          BAF_BDList.data.text = DungeonList(false)
          BAF_BDList:UpdateValue()
        end,
        width = "half",
        warning = BAFLang_SI.WARNING_ReloadUI,
        },
        {
        type = "description",
        text = DungeonList(false),
        reference = "BAF_BDList"
        },
      },
    },
  	{
		type = "submenu",
		name = BAFLang_SI.TITLE_DLCDungeon,
		controls = {
        {
        type = "dropdown",
        name = GetString(SI_CONSOLEACTIVITYTYPE1),
        choices = DungeonName(true),
        getFunc = function() return "" end,
        setFunc = function(var) DDSelect = var end,
        width = "full",
        warning = BAFLang_SI.WARNING_ReloadUI,
        },
        {
        type = "button",
        name = "↑",
        func = function() 
          DungeonSwitch(true, false)
          BAF_DDList.data.text = DungeonList(true)
          BAF_DDList:UpdateValue()
        end,
        width = "half",	
        },
        {
        type = "button",
        name = "↓",
        func = function() 
          DungeonSwitch(true, true)
          BAF_DDList.data.text = DungeonList(true)
          BAF_DDList:UpdateValue()
        end,
        width = "half",	
        },
        {
        type = "button",
        name = GetString(SI_GAMEPAD_BANK_SORT_ORDER_UP_TEXT),
        func = function() 
          BAF.savedVariables.DDSort = DungeonNameSort(true)
          BAF_DDList.data.text = DungeonList(true)
          BAF_DDList:UpdateValue()
        end,
        width = "half",	
        },
        {
        type = "button",
        name = GetString(SI_CHAT_CONFIG_RESET),
        func = function() 
          BAF.savedVariables.DDSort = {}
          for i = 1, #BAF.DLCDungeonInfo do
            if not BAF.savedVariables.DDSort[i] then
              BAF.savedVariables.DDSort[i] = i
            end
          end
          BAF_DDList.data.text = DungeonList(true)
          BAF_DDList:UpdateValue()
        end,
        width = "half",
        warning = BAFLang_SI.WARNING_ReloadUI,
        },
        {
        type = "description",
        text = DungeonList(true),
        reference = "BAF_DDList"
        },
      },
    },
	}
  BAF.SettingUpdate()
	LAM:RegisterOptionControls(BAF.name.."_Options", options)
end
----------------------------
--Restore saved setting
function BAF.SettingUpdate()
  BAFTopLevel:SetMovable(not BAF.savedVariables.Window_Lock)
  BAFTriggle_Button:SetMovable(not BAF.savedVariables.Button_Lock)
  BAFTriggle_Button:SetHidden(BAF.savedVariables.Button_Hide)
  BAFPureBlack:SetHidden(not BAF.savedVariables.Pure_Black)
end