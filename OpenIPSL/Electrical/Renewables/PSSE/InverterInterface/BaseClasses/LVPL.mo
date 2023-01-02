within OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.BaseClasses;
model LVPL "Low Voltage Power Logic"
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-20},{140,20}}),
        iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput V
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}}),
        iconTransformation(extent={{-120,-10},{-100,10}})));
        parameter OpenIPSL.Types.PerUnit Brkpt "LVPL characteristic voltage 2";
        parameter OpenIPSL.Types.PerUnit Lvpl1 "LVPL gain ";
        parameter OpenIPSL.Types.PerUnit Zerox "LVPL characteristic voltage 1";
equation

  y = noEvent(if V < Zerox then 0 else if V > Brkpt then Lvpl1 else (V-Zerox)*(Lvpl1/(Brkpt-Zerox)));

    annotation (Placement(transformation(extent={{-140,0},{-100,40}})),
                Placement(transformation(extent={{-140,-40},{-100,0}})),
                Placement(transformation(extent={{-140,-80},{-100,-40}})),
              Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),                                  graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0}),
        Text(
          extent={{-80,40},{80,-40}},
          lineColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation(info="<html>
<p>
In the inverter inteface model block diagram there are two blocks labeled, \"high-voltage reactive current management\"  and \"low-voltage power logic\". 
These blocks represent logic associated with the dynamic model and the limit in active power injection into the system.
</p>
<p>The modelling of such devices is based, mainly, on the following reference:</p>
<ul>
<li><p>Siemens: \"PSS®E Model Library\" 
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>.</p>
<blockquote></li>
</ul>
</html>"));
end LVPL;
