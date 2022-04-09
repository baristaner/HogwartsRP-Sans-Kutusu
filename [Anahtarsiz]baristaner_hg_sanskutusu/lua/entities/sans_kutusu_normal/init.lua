AddCSLuaFile("cl_init.lua") 
AddCSLuaFile("shared.lua")


include("shared.lua")


---------------------------------------------------------------------------------------------
buyuler = {
  "Everte Statum",
  "Expelliarmus",
  "Flipendo",
  "Expulso",
  "Stupefy"
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
local nadirlikonemli = math.random( 1, 1000 )

local buyulerimiz = table.Random( buyuler )
if nadirlikonemli  >= 1 && nadirlikonemli  <= 150 then
   if HpwRewrite:PlayerHasSpell(activator, buyulerimiz) then
    activator:ChatPrint("[Şans Sandığı] Zaten sahip olduğun bir büyü kazandın tekrar dene : " .. buyulerimiz .. "")
  else
    self.Entity:Remove()
    HpwRewrite:PlayerGiveSpell(activator, buyulerimiz)
    activator:PrintMessage( HUD_PRINTCENTER, "Kazandığın Büyü : " .. buyulerimiz  )
    activator:SendLua([[surface.PlaySound( "hpwrewrite/spells/cracks.wav" )]])
    BroadcastLua([[chat.AddText( Color( 196, 190, 195 ), "[Normal Şans Sandığı] ", Color( 200, 0, 0 ),"]] ..activator:Nick().. [[",Color( 255, 255, 255 )," adlı oyuncunun kazandığı büyü : ",Color( 196, 190, 195 ),"]]..buyulerimiz..[[")]]) 
end
end
end


function ENT:OnTakeDamage()
	return false 
end 


