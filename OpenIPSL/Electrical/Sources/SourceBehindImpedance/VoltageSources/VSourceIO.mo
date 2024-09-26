within OpenIPSL.Electrical.Sources.SourceBehindImpedance.VoltageSources;
model VSourceIO
  "Generic voltage source behind an internal impedance with inputs that vary the internal source magnitude and angle from steady state"
  extends BaseClasses.baseVoltageSource;
  // Input ports and polar to rectangular conversion
public
  Modelica.Blocks.Interfaces.RealInput uDEmag(start=0)
    "Input to vary the voltage magnitude of the voltage source"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput uDEang(start=0)
    "Input to vary the angle of the voltage source"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Math.PolarToRectangular p2R
    "Convert from magnitude and angle to real and imaginary"
    annotation (Placement(transformation(extent={{-42,-22},{0,20}})));
equation
  // Internal voltage source equations
  delta = delta0 + uDEang "Initial angle plus input increment";
  E = E0 + uDEmag "Initial magnitude plus input increment";
  Er = Er0 + p2R.y_re;
  Ei = Ei0 + p2R.y_im;
  connect(p2R.u_abs, uDEmag) annotation (Line(points={{-46.2,11.6},{-94,11.6},{
          -94,60},{-120,60}}, color={0,0,127}));
  connect(p2R.u_arg, uDEang) annotation (Line(points={{-46.2,-13.6},{-94,-13.6},
          {-94,-60},{-120,-60}}, color={0,0,127}));
  annotation (Diagram(graphics={              Rectangle(
          extent={{52,20},{80,-20}},
          lineColor={28,108,200},
          fillColor={217,67,180},
          fillPattern=FillPattern.Solid,
          radius=15), Text(
          extent={{-80,-18},{80,-98}},
          textColor={217,67,180},
          textString="Text Layer assigns p2R.y_re and p2R.y_im to uvre and uvim, 
which are the real and imaginary input
 voltage deviations from the initial value")}), Icon(graphics={
        Ellipse(extent={{-100,100},{100,-100}},
                                           lineColor={215,215,215},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-100,60},{-60,60}},
          color={28,108,200},
          thickness=1),
        Polygon(
          points={{3,8},{7,-2},{-1,-2},{3,8}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          origin={-48,3},
          rotation=270),
        Line(
          points={{-60,60},{-60,0}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-100,-60},{-60,-60}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-60,-60},{-60,0}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-60,0},{-40,0}},
          color={28,108,200},
          thickness=1),
        Ellipse(extent={{-40,40},{40,-40}},lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-20,-10},{0,10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Ellipse(
          extent={{0,10},{20,-10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.None,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Line(
          points={{40,0},{100,0}},
          color={0,0,255},
          thickness=1),
        Text(
          extent={{-100,140},{100,100}},
          textColor={0,0,0},
          textString="%name")}),
    Documentation(info="<html>
<p>
This model provides a voltage source with an internal voltage source and internal impedance whose magnitude and angle can be varied via inputs starting from their initial values. 

The initial values of the internal voltage source magnitude and angle are calculated based on the impedance and power flow data. 

It is based on [Du2021], with the difference that the internal impedance includes a resistance and not only a reactance. 

The purpose of this model is to support the development of Grid-Forming Inverter models as described in [Du2021].
</p>


<p>
[Du2021] W. Du, Y. Liu, F.K. Tuffner, R. Huang and Z. Huang: &quot;Model Specification of Droop-Controlled Grid-Forming Inverters (REGFM_A1)&quot;, Richland, WA, USA: Pacific Northwest National Laboratory, September 2021. <a href=\"https://www.pnnl.gov/main/publications/external/technical_reports/PNNL-32278.pdf\">document</a> 
</p>

</html>"));
end VSourceIO;
