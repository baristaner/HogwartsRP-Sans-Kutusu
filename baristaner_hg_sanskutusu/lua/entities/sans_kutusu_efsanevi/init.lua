AddCSLuaFile("cl_init.lua") 
AddCSLuaFile("shared.lua")


include("shared.lua")

---------------------------------------------------------------------------------------------
efsanevi = {
  "Avada kedavra",
  "Dragoner",
  "Apparition",
  "Bombarda"
}
---------------------------------------------------------------------------------------------
function ENT:Initialize( )
	
	self:SetModel( "models/gchest/gchest.mdl" ) 
    self:PhysicsInit( SOLID_VPHYSICS )
    self:SetMoveType( MOVETYPE_VPHYSICS )
    self:SetSolid( SOLID_VPHYSICS )
	local phys = self:GetPhysicsObject()
    phys:Wake()

end

function ENT:Use(activator,name)
local nadirlikonemliefsanevi = math.random( 1, 1000 )
if activator:GetPData("anahtar") == "var" then
local buyulerimizefsane = table.Random( efsanevi )
if nadirlikonemliefsanevi  >= 1 && nadirlikonemliefsanevi <= 150 then
  if HpwRewrite:PlayerHasSpell(activator, buyulerimizefsane) then
    activator:ChatPrint("[Şans Sandığı] Zaten sahip olduğun bir büyü kazandın tekrar dene : " .. buyulerimizefsane .. "")
  else
    self.Entity:Remove()
    activator:SetPData( "anahtar", "yok")
    HpwRewrite:PlayerGiveLearnableSpell(activator, buyulerimizefsane)
    activator:PrintMessage( HUD_PRINTCENTER, "Kazandığın Büyü : " .. buyulerimizefsane  )
    activator:SendLua([[surface.PlaySound( "hpwrewrite/spells/cracks.wav" )]])
    BroadcastLua([[chat.AddText( Color( 255, 230, 0 ), "[Nadir Şans Sandığı] ", Color( 200, 0, 0 ),"]] ..activator:Nick().. [[",Color( 255, 255, 255 )," adlı oyuncunun kazandığı büyü : ",Color( 255, 230, 0 ),"]]..buyulerimizefsane..[[")]])
end
end
else
  activator:ChatPrint("Anahtarın Yok")
end
end


function ENT:OnTakeDamage()
	return false 
end 


