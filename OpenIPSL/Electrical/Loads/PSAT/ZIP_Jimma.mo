within OpenIPSL.Electrical.Loads.PSAT;
model ZIP_Jimma "Jimma - Jimma's Load"
  extends BaseClasses.baseLoad;
  parameter Types.Time Tf=0.01 "Time constant of the high-pass filter";
  parameter Types.PerUnit Pz=0.33 "Conductance";
  parameter Types.PerUnit Pi=0.33 "Active current";
  parameter Types.PerUnit Pp=1 - Pz - Pi "Active power";
  parameter Types.PerUnit Qz=0.33 "Susceptance";
  parameter Types.PerUnit Qi=0.33 "Reactive current";
  parameter Types.PerUnit Qp=1 - Qz - Qi "Reactive power";
  parameter Types.Time Kv=100 "Coefficient of the voltage time derivative (system base)";
protected
  parameter Types.Time T=if Tf > 0 then Tf else 0.001
    "Time constant used: Tf, or 0.001 s for Tf = 0, as in PSAT";
  Real a(start=1) "Auxiliary variable, voltage division";
  Real b "Auxiliary variable, derivation";
  Real x(start=-v_0/T);
initial equation
  der(x) = 0;
equation
  assert(Tf > 0, "ZIP_Jimma: Tf cannot be zero; Tf = 0.001 s is used, as PSAT does.", AssertionLevel.warning);
  a = v/v_0;
  der(x) = ((-v/T) - x)/T;
  b = x + v/T;
  P = P_0/S_b*(Pz*a^2 + Pi*a + Pp);
  Q = Q_0/S_b*(Qz*a^2 + Qi*a + Qp) + Kv*b;
  annotation (
    Documentation(info="<html>
<p>Jimma's load: a ZIP load whose reactive power also responds to the time derivative of the voltage,
taken through a high-pass filter of time constant <code>Tf</code>:</p>
<p><code>P = P_0/S_b*(Pz*a^2 + Pi*a + Pp)</code>,
<code>Q = Q_0/S_b*(Qz*a^2 + Qi*a + Qp) + Kv*b</code>, with <code>a = v/v_0</code>,
<code>b = x + v/Tf</code> and <code>der(x) = (-v/Tf - x)/Tf</code>.</p>
<p>As in PSAT (<code>@JIclass</code>), the voltage-derivative term <code>Kv*b</code> is on the
system base, not scaled by <code>Q_0</code>, and the filter starts in steady state,
<code>x = -v_0/Tf</code>.</p>
<p><code>Kv</code> is in seconds: it turns the filtered voltage derivative <code>b</code> (pu/s)
into reactive power (pu), as in eq. 16.16 of the PSAT 2.1.11 manual,
<code>q = ... + Kv*dv/dt</code>. Table 16.8 of that manual gives its unit as 1/s, which is an
error of the manual: with 1/s the term would be in pu/s<sup>2</sup>.</p>
<p><code>Tf</code> cannot be zero, since the filter divides by it. PSAT replaces
<code>Tf = 0</code> with 0.001 s and warns (<code>@JIclass/setx0.m</code>); this model does the
same, with a warning, so that a case translated from PSAT behaves as it does there.</p>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-09</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end ZIP_Jimma;
