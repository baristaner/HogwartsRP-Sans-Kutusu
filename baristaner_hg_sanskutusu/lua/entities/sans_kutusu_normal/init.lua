AddCSLuaFile("cl_init.lua") 
AddCSLuaFile("shared.lua")


include("shared.lua")


---------------------------------------------------------------------------------------------
buyuler = {
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
local nadirlikonemli = math.random( 1, 1000 )
if activator:GetPData("anahtar") == "var" then
local buyulerimiz = table.Random( buyuler )
if nadirlikonemli  >= 1 && nadirlikonemli  <= 150 then
   if HpwRewrite:PlayerHasSpell(activator, buyulerimiz) then
    activator:ChatPrint("[Şans Sandığı] Zaten sahip olduğun bir büyü kazandın tekrar dene : " .. buyulerimiz .. "")
  else
    --activator:SetPData( "anahtar", activator:GetPData("anahtar") - 1)
    self.Entity:Remove()
    activator:SetPData( "anahtar", "yok")
    activator:ChatPrint("Kalan Anahtar Sayısı : " ..activator:GetPData("anahtar"))
    HpwRewrite:PlayerGiveLearnableSpell(activator, buyulerimiz)
    activator:PrintMessage( HUD_PRINTCENTER, "Kazandığın Büyü : " .. buyulerimiz  )
    activator:SendLua([[surface.PlaySound( "hpwrewrite/spells/cracks.wav" )]])
    BroadcastLua([[chat.AddText( Color( 196, 190, 195 ), "[Normal Şans Sandığı] ", Color( 200, 0, 0 ),"]] ..activator:Nick().. [[",Color( 255, 255, 255 )," adlı oyuncunun kazandığı büyü : ",Color( 196, 190, 195 ),"]]..buyulerimiz..[[")]]) 

end
end
else
  activator:ChatPrint("Anahtarın Yok")
end
end


function ENT:OnTakeDamage()
	return false 
end 


