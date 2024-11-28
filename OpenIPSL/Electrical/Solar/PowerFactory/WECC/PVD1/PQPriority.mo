within OpenIPSL.Electrical.Solar.PowerFactory.WECC.PVD1;
model PQPriority "P-Q priority module"
  parameter Boolean PqFlag "Priority on current limit flag: 1=P prio.; 0 = Q prio.";
  parameter Types.PerUnit Imax "Maximum allowable total converter current";
  Modelica.Blocks.Interfaces.RealInput Ip annotation (Placement(transformation(origin={-120,50}, extent={{-20,-20},{20,20}}), iconTransformation(origin={-120,50}, extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealInput Iq annotation (Placement(transformation(origin={-120,-50}, extent={{-20,-20},{20,20}}), iconTransformation(origin={-120,-50}, extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealOutput Iqcmd annotation (Placement(transformation(origin={110,-50}, extent={{-10,-10},{10,10}}), iconTransformation(origin={110,-50}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput Ipcmd annotation (Placement(transformation(origin={110,50}, extent={{-10,-10},{10,10}}), iconTransformation(origin={110,50}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Nonlinear.VariableLimiter IpLimiter annotation (Placement(transformation(origin={20,50}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Nonlinear.VariableLimiter IqLimiter annotation (Placement(transformation(origin={20,-50}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression Imax_(y=Imax) annotation (Placement(transformation(extent={{102,-10},{82,10}})));
  Modelica.Blocks.Math.Feedback diffQ annotation (Placement(transformation(extent={{20,-20},{0,0}})));
  Modelica.Blocks.Math.Product Ipcmd2 annotation (Placement(transformation(extent={{60,20},{40,40}})));
  Modelica.Blocks.Math.Product Iqcmd2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,-30})));
  Modelica.Blocks.Logical.Switch Ipmax_ annotation (Placement(transformation(extent={{-50,20},{-30,40}})));
  Modelica.Blocks.Logical.Switch Iqmax_ annotation (Placement(transformation(extent={{-48,-40},{-28,-20}})));
  Modelica.Blocks.Sources.BooleanExpression PqFlag_(y=PqFlag) annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Modelica.Blocks.Math.Product Imax2 annotation (Placement(transformation(extent={{60,-10},{40,10}})));
  Modelica.Blocks.Sources.RealExpression zero(y=0) annotation (Placement(transformation(extent={{-16,34},{0,50}})));
  Modelica.Blocks.Math.Gain neg(k=-1) annotation (Placement(transformation(extent={{-10,-62},{-2,-54}})));
  Modelica.Blocks.Math.Feedback diffP annotation (Placement(transformation(extent={{20,20},{0,0}})));
equation
  connect(IqLimiter.y, Iqcmd) annotation (Line(points={{31,-50},{110,-50}}, color={0,0,127}));
  connect(IpLimiter.y, Ipcmd) annotation (Line(points={{31,50},{110,50}}, color={0,0,127}));
  connect(Ip, IpLimiter.u) annotation (Line(points={{-120,50},{8,50}}, color={0,0,127}));
  connect(Iq, IqLimiter.u) annotation (Line(points={{-120,-50},{8,-50}}, color={0,0,127}));

  connect(IpLimiter.y, Ipcmd2.u2) annotation (Line(points={{31,50},{68,50},{68,24},{62,24}}, color={0,0,127}));
  connect(Iqcmd2.u1, IqLimiter.y) annotation (Line(points={{62,-36},{68,-36},{68,-50},{31,-50}}, color={0,0,127}));
  connect(Ipmax_.y, IpLimiter.limit1) annotation (Line(points={{-29,30},{-20,30},{-20,58},{8,58}}, color={0,0,127}));
  connect(Imax_.y, Ipmax_.u1) annotation (Line(points={{81,0},{74,0},{74,70},{-60,70},{-60,38},{-52,38}}, color={0,0,127}));
  connect(PqFlag_.y, Ipmax_.u2) annotation (Line(points={{-79,0},{-60,0},{-60,30},{-52,30}}, color={255,0,255}));
  connect(Imax2.y, diffQ.u1) annotation (Line(points={{39,0},{30,0},{30,-10},{18,-10}}, color={0,0,127}));
  connect(Iqcmd2.y, diffQ.u2) annotation (Line(points={{39,-30},{10,-30},{10,-18}}, color={0,0,127}));
  connect(diffQ.y, Ipmax_.u3) annotation (Line(points={{1,-10},{-40,-10},{-40,10},{-56,10},{-56,22},{-52,22}}, color={0,0,127}));
  connect(Imax2.u1, Imax_.y) annotation (Line(points={{62,6},{66,6},{66,0},{81,0}}, color={0,0,127}));
  connect(zero.y, IpLimiter.limit2) annotation (Line(points={{0.8,42},{8,42}}, color={0,0,127}));
  connect(Iqmax_.u2, PqFlag_.y) annotation (Line(points={{-50,-30},{-60,-30},{-60,0},{-79,0}}, color={255,0,255}));
  connect(Iqcmd2.u2, Iqcmd2.u1) annotation (Line(points={{62,-24},{68,-24},{68,-36},{62,-36}}, color={0,0,127}));
  connect(Imax_.y, Imax2.u2) annotation (Line(points={{81,0},{66,0},{66,-6},{62,-6}}, color={0,0,127}));
  connect(Ipcmd2.u2, Ipcmd2.u1) annotation (Line(points={{62,24},{68,24},{68,36},{62,36}}, color={0,0,127}));
  connect(Imax_.y, Iqmax_.u3) annotation (Line(points={{81,0},{74,0},{74,-80},{-60,-80},{-60,-38},{-50,-38}}, color={0,0,127}));
  connect(Iqmax_.y, IqLimiter.limit1) annotation (Line(points={{-27,-30},{-20,-30},{-20,-42},{8,-42}}, color={0,0,127}));
  connect(IqLimiter.limit2, neg.y) annotation (Line(points={{8,-58},{-1.6,-58}}, color={0,0,127}));
  connect(neg.u, Iqmax_.y) annotation (Line(points={{-10.8,-58},{-20,-58},{-20,-30},{-27,-30}}, color={0,0,127}));
  connect(diffP.u1, Imax2.y) annotation (Line(points={{18,10},{30,10},{30,0},{39,0}}, color={0,0,127}));
  connect(diffP.u2, Ipcmd2.y) annotation (Line(points={{10,18},{10,30},{39,30}}, color={0,0,127}));
  connect(diffP.y, Iqmax_.u1) annotation (Line(points={{1,10},{-20,10},{-20,0},{-56,0},{-56,-22},{-50,-22}}, color={0,0,127}));
  annotation (Icon(graphics={
        Rectangle(
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,100},{100,-100}}),
        Text(
          origin={20,90},
          extent={{-120,0},{80,-20}},
          textString="%name",
          lineColor={0,0,0}),
        Text(extent={{-100,60},{-60,40}}, textString="Ipref"),
        Text(extent={{-100,-40},{-60,-60}}, textString="Iqref"),
        Text(extent={{58,60},{98,40}}, textString="Ipcmd"),
        Text(extent={{58,-40},{98,-60}}, textString="Iqcmd")}));
end PQPriority;
