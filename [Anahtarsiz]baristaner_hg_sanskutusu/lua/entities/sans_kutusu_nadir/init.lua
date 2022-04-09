AddCSLuaFile("cl_init.lua") 
AddCSLuaFile("shared.lua")


include("shared.lua")


---------------------------------------------------------------------------------------------
nadir = {
  "Everte Statum",
  "Expelliarmus",
  "Flipendo",
  "Expulso",
  "Stupefy",
  "Immobulus",
  "Sectumsempra"
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
local nadirlikonemlinadir = math.random( 1, 1000 )

local buyulerimiznadir = table.Random( nadir )
if nadirlikonemlinadir  >= 1 && nadirlikonemlinadir  <= 150 then
  if HpwRewrite:PlayerHasSpell(activator, buyulerimiznadir) then
    activator:ChatPrint("[Şans Sandığı] Zaten sahip olduğun bir büyü kazandın tekrar dene : " .. buyulerimiznadir .. "")
  else
    self.Entity:Remove()
    HpwRewrite:PlayerGiveSpell(activator, buyulerimiznadir)
    activator:PrintMessage( HUD_PRINTCENTER, "Kazandığın Büyü : " .. buyulerimiznadir  )
    activator:SendLua([[surface.PlaySound( "hpwrewrite/spells/cracks.wav" )]])
    BroadcastLua([[chat.AddText( Color( 247, 0, 255 ), "[Nadir Şans Sandığı] ", Color( 200, 0, 0 ),"]] ..activator:Nick().. [[",Color( 255, 255, 255 )," adlı oyuncunun kazandığı büyü : ",Color( 247, 0, 255 ),"]]..buyulerimiznadir..[[")]])
end
end
end



function ENT:OnTakeDamage()
	return false 
end 


