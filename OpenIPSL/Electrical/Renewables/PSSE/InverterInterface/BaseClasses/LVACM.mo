within OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.BaseClasses;
model LVACM "Low Voltage Active Control Management"
        parameter Real lvpnt0 "Low voltage point for low voltage active current management (pu)";
        parameter Real lvpnt1 "High voltage point for low voltage active current management (pu)";
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-20},{140,20}}),
        iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput Vt
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}}),
        iconTransformation(extent={{-120,-10},{-100,10}})));

equation
  y = smooth(1,noEvent(if Vt <= lvpnt0 then 0 elseif Vt >= lvpnt1 then 1 else (1/(lvpnt1-lvpnt0))*(Vt-lvpnt0)));
    annotation (Placement(transformation(extent={{-100,-20},{-60,20}}),
        iconTransformation(extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-28,-102})),
                Placement(transformation(extent={{-100,-80},{-60,-40}}),
        iconTransformation(extent={{-20,-20},{20,20}},
        rotation=90,
        origin={66,-102})),
              Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                         graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0}),
        Text(
          extent={{-80,40},{80,-40}},
          lineColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="%name"),
        Line(points={{-32,66}}, color={28,108,200})}),           Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation(info="<html>
<p>
In the inverter inteface model block diagram there are two blocks labeled, \"high-voltage reactive current management\"  and \"low-voltage power logic\". 
These blocks represent logic associated with the dynamic model and the limit in active power injection into the system.
</p>
<p>The modelling of such devices is based, mainly, on the following references:</p>
<ul>
<li><em>Siemens PTI, PSS®E 34.2.0 model library</em>, by Siemens Power Technologies International, Schenectady, NY (2017).</li>
</ul>
</html>"));
end LVACM;
