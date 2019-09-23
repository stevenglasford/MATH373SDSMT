function [RombergF,Rombergd,Gauss4F,Gauss4d,...
    Gauss5F,Gauss5d,AdaptF,Adaptd] = hw5()

H = 30;
f = @(z) 200*(z/(5+z))*exp(-2*z/H);
f1 = @(z) z*200*(z/(5+z))*exp(-2*z/H);

[RombergF,Rerror,Riter] = romberg(f,0,H);
[Rombergd,R1error,R1iter] = romberg(f1,0,H);
Rombergd = Rombergd/RombergF;

Gauss4F = gauss_quad(f,0,H,4);
Gauss4d = gauss_quad(f1,0,H,4) / Gauss4F;

Gauss5F = gauss_quad(f,0,H,5);
Gauss5d = gauss_quad(f1,0,H,5) / Gauss5F;

AdaptF = quad_step(f,0,H);
Adaptd = quad_step(f1,0,H)/AdaptF;

end