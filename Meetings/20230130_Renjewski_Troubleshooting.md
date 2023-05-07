# 20230130_Renjewski_Troubleshooting.md

- Magnitude of velocity vector: Opposite phase oscillation of components
- Course of the hip velocity from VLO to TD: Does not converge
- Angles in degrees but velocities in rad/s: Error in AEA ((omega x r with the omega of the torso) -> v_proj = v_com + r x omega)

- Hip velocity: x, y can distribute differently depending on how far it tilts. v = r x omega, r is leg length, omega is vphi of torso
- Velocity vector is wrong! r is leg length, omega is angular velocity, let draw with quiver, get x, y (origin) of vector (Current position hip, CoM) and u, v (x, y component of vector) with scale factor (1, if too long then turn down)
- Set initial velocity hip to non-zero (e.g., calculate 0.4 m/s over leg length back to angular velocity)
- Constraint: Touchdown velocity may deviate only certain percentage from initial velocity
- Use two clearly different GM_h
- How are initial and touchdown speed related via GM_h?

- Hüftgeschwindigkeit: x, y können sich je nachdem wie weit es kippt unterschiedlich verteilen. v = r x omega, r ist Beinlänge, omega ist vphi des torsos
- Geschwindigkeitsvektor ist falsch! r ist Beinlänge, omega ist Winkelgeschwindigkeit, mit quiver zeichnen lassen, kriegt x, y (Ursprung) des Vektors (Aktuelle Position Hüfte, CoM) und u, v (x, y Komponente des Vektors) mit Skalierungsfaktor (1, wenn zu lang dann runterdrehen)
- Anfangsgeschwindigkeit hüfte auf nicht Null setzen (zB 0.4 m/s über Beinlänge auf Winkelgeschwindigkeit zurückrechnen)
- Nebenbedingung: Touchdown Geschwindigkeit darf nur gewissen Prozentsatz von Anfangsgeschwindigkeit abweichen
- Zwei deutlich unterschiedliche GM_h verwenden
- Wie hängen Anfangs- und Touchdowngeschwidigkeit über GM_h zusammen?



Geschwindigkeitsvektor gemappt auf die Hüfte aus der Rotation des Oberkörpers
Absolutgeschwindigkeit der Hüfte in der Welt
