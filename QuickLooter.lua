local A = CreateFrame("Frame")


A:RegisterEvent("LOOT_READY")

A:SetScript("OnEvent", function(self, event, ...)
	return self[event] and self[event](self, ...)
end)


function A:LOOT_READY(autoloot)
	if autoloot then
		local method, masterPartyID = GetLootMethod()
		if method == "master" and masterPartyID == 0 then return end
		for i = 1, GetNumLootItems() do
			LootSlot(i)
		end
	end
end
