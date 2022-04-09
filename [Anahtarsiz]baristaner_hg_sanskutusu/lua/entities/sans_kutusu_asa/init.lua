AddCSLuaFile("cl_init.lua") 
AddCSLuaFile("shared.lua")

include("shared.lua")

---------------------------------------------------------------------------------------------
asalar = {
  "Dark Wand",
  "Mind Wand"
}
---------------------------------------------------------------------------------------------
function ENT:Initialize( )
	
	self:SetModel( "models/gchest/gchest.mdl" ) 
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
    phys:Wake()

end

function ENT:Use(activator,name)
local asalarrastgele = math.random( 1, 1000 )

local asasalla = table.Random( asalar )
if asalarrastgele  >= 1 && asalarrastgele <= 150 then
    if HpwRewrite:PlayerHasSpell(activator, asasalla) then
    activator:ChatPrint("[Şans Sandığı] Zaten sahip olduğun bir asa kazandın tekrar dene : " .. asasalla .. "")
  else
    self.Entity:Remove()
    HpwRewrite:PlayerGiveLearnableSpell(activator,asasalla,false)
    activator:PrintMessage( HUD_PRINTCENTER, "Kazandığın Büyü : " .. asasalla  )
    BroadcastLua([[chat.AddText( Color( 0, 179, 255 ), "[Asa Şans Sandığı] ", Color( 200, 0, 0 ),"]] ..activator:Nick().. [[",Color( 255, 255, 255 )," adlı oyuncunun kazandığı asa : ",Color( 0, 179, 255 ),"]]..asasalla..[[")]])
end
end
end

function ENT:OnTakeDamage()
	return false 
end 