if SERVER then
	
	AddCSLuaFile()
	
	resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_watc.vmt")
end

function ROLE:PreInitialize()
	self.color = Color(137, 17, 237, 255)
	self.dkcolor = Color(17, 69, 200, 255)
	self.bgcolor = Color(255, 157, 72, 255)
	self.abbr = "watc"
	self.scoreKillsMultiplier = 1
	self.scoreTeamKillsMultiplier = -8
	self.fallbackTable = {}
	self.unknownTeam = true
	
	self.defaultTeam = TEAM_INNOCENT
	self.defaultEquipment = SPECIAL_EQUIPMENT

	-- conVarData
	self.conVarData = {
		pct = 0.13,
		maximum = 32,
		minPlayers = 8,
		minKarma = 600,

		credits = 1,
		creditsTraitorKill = 0,
		creditsTraitorDead = 1,

		togglable = true,
		shopFallback = SHOP_FALLBACK_DETECTIVE
	}
end

function ROLE:Initialize()
    roles.SetBaseRole(self, ROLE_DETECTIVE)
	
	if CLIENT then
		-- Role specific language elements
		LANG.AddToLanguage("English", self.name, "Watchdog")
		LANG.AddToLanguage("English", "info_popup_" .. self.name, [[You are a Watchdog!
	Try to get some credits!]])
		LANG.AddToLanguage("English", "body_found_" .. self.abbr, "This was a Watchdog...")
		LANG.AddToLanguage("English", "search_role_" .. self.abbr, "This person was a Watchdog!")
		LANG.AddToLanguage("English", "target_" .. self.name, "Watchdog")
		LANG.AddToLanguage("English", "ttt2_desc_" .. self.name, [[The Watchdog is a Detective (who works together with the other detectives)]])

		LANG.AddToLanguage("Deutsch", self.name, "Wachhund")
		LANG.AddToLanguage("Deutsch", "info_popup_" .. self.name, [[Du bist ein Wachhund!
	Versuche ein paar Credits zu bekommen!]])
		LANG.AddToLanguage("Deutsch", "body_found_" .. self.abbr, "Er war ein Wachhund...")
		LANG.AddToLanguage("Deutsch", "search_role_" .. self.abbr, "Diese Person war ein Wachhund!")
		LANG.AddToLanguage("Deutsch", "target_" .. self.name, "Wachhund")
		LANG.AddToLanguage("Deutsch", "ttt2_desc_" .. self.name, [[Der Wachhund ist ein Detektiv (der mit den anderen Detektiv-Rollen zusammenarbeitet)]])
	end
end

if SERVER then
	-- Give Loadout on respawn and rolechange	
	function ROLE:GiveRoleLoadout(ply, isRoleChange)
		ply:GiveEquipmentWeapon("weapon_ttt_dete_playercam")
	end

	-- Remove Loadout on death and rolechange
	function ROLE:RemoveRoleLoadout(ply, isRoleChange)
		ply:StripWeapon("weapon_ttt_dete_playercam")
	end
end
