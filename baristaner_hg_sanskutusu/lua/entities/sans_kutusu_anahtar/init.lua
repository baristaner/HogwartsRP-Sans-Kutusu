AddCSLuaFile("cl_init.lua") 
AddCSLuaFile("shared.lua")


include("shared.lua")


function ENT:Initialize( )
	
	self:SetModel( "models/spartex117/key.mdl" ) 
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
    phys:Wake()

end

function ENT:Use(activator,name)
    activator:SetPData( "anahtar", "var")
    self.Entity:Remove()
    activator:PrintMessage( HUD_PRINTCENTER, "Anahtar Alındı" )
end


function ENT:OnTakeDamage()
	return false 
end 


