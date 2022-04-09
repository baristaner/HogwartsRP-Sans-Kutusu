
ENT.Base = "base_ai" 
ENT.Type = "ai" 
ENT.AutomaticFrameAdvance = true 
ENT.Spawnable 			  = true
ENT.AdminSpawnable        = false
ENT.PrintName             = "Normal Sans Sandigi"
ENT.Purpose 			  = "Sans"
ENT.Category 			  = "Sans Sandiklari"
ENT.RenderGroup	= 9
 
function ENT:SetAutomaticFrameAdvance( bUsingAnim ) 
	self.AutomaticFrameAdvance = bUsingAnim
end