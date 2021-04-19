function R = Ang2Rot(th)

R = [cos(th) -sin(th) 0
     sin(th)  cos(th) 0
        0       0     1];

end