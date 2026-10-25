within OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM;
model GFL_FaultPSCAD "Converter with EPRI's PSCAD parameter set on an ideal 650 V source: power step at 2 s, 0.7 pu dip at 5 s"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant Qref(k=0)
    annotation (Placement(transformation(extent={{-92,-6},{-80,6}})));
  Modelica.Blocks.Sources.Constant Vref(k=1)
    annotation (Placement(transformation(extent={{-94,-46},{-82,-34}})));
  Modelica.Blocks.Sources.Step Pref(
    height=0.2,
    offset=0.2,
    startTime=2)
    annotation (Placement(transformation(extent={{-92,34},{-80,46}})));
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.GridWithFault gridWithFault(Vbase=650)        annotation (Placement(
        transformation(rotation=0, extent={{100,-28},{158,30}})));
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR gFM_GFL_IBR(
    c_filter=0.0105,
    r_damp=0.0401,
    l_filter=1.1207e-06,
    r_l=0,
    dllParameters=OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Records.PSCAD())
    annotation (Placement(transformation(extent={{-50,-28},{8,30}})));
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.Line_R line_R(
      Resistance=0.005)
    annotation (Placement(transformation(extent={{22,-28},{80,30}})));
equation

  connect(Vref.y, gFM_GFL_IBR.V_ref_pu) annotation (Line(points={{-81.4,-40},{-60,
          -40},{-60,-16.4},{-50,-16.4}}, color={0,0,127}));
  connect(Qref.y, gFM_GFL_IBR.Q_ref_pu)
    annotation (Line(points={{-79.4,0},{-78,1},{-50,1}}, color={0,0,127}));
  connect(Pref.y, gFM_GFL_IBR.P_ref_pu) annotation (Line(points={{-79.4,40},{-60,
          40},{-60,18.4},{-50,18.4}}, color={0,0,127}));
  connect(gFM_GFL_IBR.C, line_R.p2)
    annotation (Line(points={{8,18.4},{22,18.4}}, color={0,0,255}));
  connect(gFM_GFL_IBR.B, line_R.p)
    annotation (Line(points={{8,1},{22,1}}, color={0,0,255}));
  connect(gFM_GFL_IBR.A, line_R.p1)
    annotation (Line(points={{8,-16.4},{22,-16.4}}, color={0,0,255}));
  connect(line_R.n2, gridWithFault.C)
    annotation (Line(points={{80,18.4},{100,18.4}}, color={0,0,255}));
  connect(line_R.n, gridWithFault.B)
    annotation (Line(points={{80,1},{100,1}}, color={0,0,255}));
  connect(line_R.n1, gridWithFault.A)
    annotation (Line(points={{80,-16.4},{100,-16.4}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
The converter <code>gFM_GFL_IBR</code> with the DLL parameter record
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Records.PSCAD\">Records.PSCAD</a> (0.65 kV,
100 MVA) and the matching electrical filter (<code>c_filter = 0.0105 F</code>, <code>r_damp = 0.0401 Ohm</code>,
<code>l_filter = 1.1207e-6 H</code>, <code>r_l = 0</code>) feeds an ideal 650 V source
(<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.GridWithFault\">GridWithFault</a>)
through 5 mOhm per phase (<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.Line_R\">Line_R</a>).
It is the only test of the PSCAD parameter set.
</p>
<ul>
<li>Events: the active power reference steps from 0.2 to 0.4 pu at 2 s; the source voltage dips to 0.7 pu at 5 s and
recovers at 5.1 s. Reactive power reference 0, voltage reference 1 pu.</li>
<li>Expected steady state: P follows the reference (20 MW, then 40 MW), while Q settles at about -72 Mvar (-0.72 pu
on 100 MVA) although the reactive power reference is 0. The record works in voltage droop (<code>KvDroop</code> = 30),
and the 5 mOhm line is 1.18 pu on the 650 V, 100 MVA base, so the droop holds the reactive power away from zero;
this is not a defect of the port (Dymola 2026x Refresh 1, 2026-10-25). The pull request's test had the same line.</li>
<li>Plot <code>gFM_GFL_IBR.grid_sensor_a.voltage</code>, <code>.grid_sensor_b.voltage</code>,
<code>.grid_sensor_c.voltage</code> (V) and the matching <code>.current</code> signals (A) at the converter terminal,
<code>gFM_GFL_IBR.out[11]</code> (P, MW) and <code>gFM_GFL_IBR.out[12]</code> (Q, Mvar).</li>
<li>The shipped library steps the controller every 1e-5 s; EPRI's PSCAD setup used 2e-5 s, a compile-time constant of
the DLL (see Records.PSCAD), so results are close to, not identical with, the PSCAD case. No figure of the papers uses
this case.</li>
</ul>
<p>
Ported from <code>GFM_PSCAD.GFM_Test</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>, which used a separate DLL compiled with the PSCAD
constants and a 2e-5 s Dymola step; StopTime 5.8 s (fault plus recovery; the pull request ran 10 s and had no plot
script for this case).
</p>
<h4>How to run</h4>
<ul>
<li>Dymola: simulate as is; the experiment annotation selects fixed-step Euler with a 1e-5 s step.</li>
<li>OpenModelica: the annotation <code>__OpenModelica_simulationFlags(s=&quot;euler&quot;)</code> selects Euler, whose
step equals the output interval, so simulate with <code>method=&quot;euler&quot;</code> and
<code>numberOfIntervals = StopTime/1e-5</code> (here 580000).</li>
<li>System Modeler: choose the Euler method with a step size of 1e-5 s in the simulation settings; the library must be
trusted to evaluate external functions.</li>
</ul>
<p>
The shared library <code>GFM_GFL_IBR</code> must exist for the platform in <code>OpenIPSL/Resources/Library</code>;
see the <a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.README\">README</a> of this test package for the build and the tool details.
</p>
</html>"),
    experiment(
      StopTime=5.8,
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Euler",
      __Dymola_fixedstepsize=1e-05),
    __OpenModelica_simulationFlags(s="euler"));
end GFL_FaultPSCAD;
