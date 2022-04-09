include("shared.lua")



hook.Add( "PreDrawHalos", "sanskutusu", function()
    if IsValid(LocalPlayer():GetEyeTrace().Entity) and LocalPlayer():GetEyeTrace().Entity:GetClass()=="sans_kutusu_efsanevi" then
        halo.Add( { LocalPlayer():GetEyeTrace().Entity }, Color( 255,215,0 ), 3, 3, 2 )
    end
end )

function ENT:Initialize()
    self.csModel = ClientsideModel("models/gchest/gchest.mdl")
end


function ENT:Draw()


    local aci = (CurTime() * 90 ) % 360
    local genis = math.sin(CurTime() * 3) * 5

    self.csModel:SetPos(self:GetPos())
    self.csModel:SetAngles(Angle(0,aci,0))



    if ( IsValid( self ) && LocalPlayer():GetPos():Distance( self:GetPos() ) < 500 ) then

         local ang = Angle( 0, ( LocalPlayer():GetPos() - self:GetPos() ):Angle()[ "yaw" ], ( LocalPlayer():GetPos() - self:GetPos() ):Angle()[ "pitch" ] ) + Angle( 0, 90, 90 )

        cam.IgnoreZ( false )
        cam.Start3D2D( self:GetPos() + Vector( -1, 0, 50 ), ang, .1 )

            draw.RoundedBox(0,-320,-48,620,90, Color(0, 0, 0, 150))
            draw.SimpleTextOutlined( self:GetNWString( "HeaderText", "Efsanevi Sans Sandigi" ), "npc", -10, 0, Color( 255, 230, 0,255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, .5, Color( 0, 0, 0, 255 ) )
        cam.End3D2D()

    end

end

function ENT:OnRemove()
    self.csModel:Remove()
end


