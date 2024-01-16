within OpenIPSL.Examples.Microgrids.IEEEMicrogrid;
model IEEEMicrogrid_3
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Buses.Bus Bus4(
    V_b=400,
    v_0=PF_results.voltages.V4,
    angle_0=PF_results.voltages.A4,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={140,100})));
  OpenIPSL.Electrical.Branches.PwLine substation_line_2(
    R=0.0785/2,
    X=0.0818/2,
    G=0,
    B=0)                                                annotation (Placement(
        transformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={90,120})));
  OpenIPSL.Electrical.Buses.Bus Bus3(
    V_b=400,
    v_0=PF_results.voltages.V3,
    angle_0=PF_results.voltages.A3,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={40,100})));
  OpenIPSL.Electrical.Branches.PwLine substation_line_1(
    R=0.04257/2,
    X=0.0796/2,
    G=0,
    B=0)                                                annotation (Placement(
        transformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={-10,120})));
  OpenIPSL.Electrical.Buses.Bus Bus2(
    V_b=400,
    v_0=PF_results.voltages.V2,
    angle_0=PF_results.voltages.A2,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={-60,100})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer Transformer(
    CZ=1,
    R=0,
    X=0.057,
    G=0,
    B=0,
    CW=1,
    VB1=11000,
    VB2=400)
          annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={-100,100})));
  OpenIPSL.Electrical.Buses.Bus Bus1(
    V_b=11000,
    v_0=PF_results.voltages.V1,
    angle_0=PF_results.voltages.A1,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={-140,100})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS GRID(
    V_b=11000,
    R_a=0.1,
    X_d=0)
    annotation (Placement(transformation(extent={{-240,80},{-200,120}})));

  inner OpenIPSL.Electrical.SystemBase SysData(fn=60)
    annotation (Placement(transformation(extent={{-208,160},{-168,180}})));
  OpenIPSL.Electrical.Events.PwFault Fault1(
    R=0.01,
    X=0.1,
    t1=1000,
    t2=1001) annotation (Placement(transformation(extent={{-20,140},{0,160}})));
  OpenIPSL.Electrical.Events.PwFault Fault2(
    R=0.5,
    X=0.5,
    t1=1000,
    t2=1001) annotation (Placement(transformation(extent={{80,140},{100,160}})));
  OpenIPSL.Electrical.Branches.PwLine substation_line_3(
    R=0.0785/2,
    X=0.0818/2,
    G=0,
    B=0)                                                annotation (Placement(
        transformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={90,80})));
  OpenIPSL.Electrical.Branches.PwLine substation_line_4(
    R=0.04257/2,
    X=0.0796/2,
    G=0,
    B=0)                                                annotation (Placement(
        transformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={-10,80})));
  OpenIPSL.Electrical.Loads.PSSE.Load load(
    V_b=400,
    P_0(displayUnit="kW") = PF_results.loads.P1,
    Q_0(displayUnit="kvar") = PF_results.loads.Q1,
    v_0=PF_results.voltages.V5,
    angle_0=PF_results.voltages.A5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,-150})));
  OpenIPSL.Electrical.Banks.PSSE.Shunt capacitor_bank(G=0, B=0.02/4)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-190,-150})));
  OpenIPSL.Electrical.Events.Breaker breaker(enableTrigger=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-190,-120})));
  OpenIPSL.Electrical.Banks.PSSE.Shunt capacitor_bank1(G=0, B=0.02/4)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-150,-150})));
  OpenIPSL.Electrical.Events.Breaker breaker1(enableTrigger=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-150,-120})));
  OpenIPSL.Electrical.Banks.PSSE.Shunt capacitor_bank2(G=0, B=0.02/4)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-150})));
  OpenIPSL.Electrical.Events.Breaker breaker2(enableTrigger=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-110,-120})));
  OpenIPSL.Electrical.Banks.PSSE.Shunt capacitor_bank3(G=0, B=0.02/4)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,-150})));
  OpenIPSL.Electrical.Events.Breaker breaker3(enableTrigger=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-120})));
  GeneratorGroups.DieselGeneratorUnit Diesel(
    P_0(displayUnit="kW") = PF_results.machines.PDT,
    Q_0=PF_results.machines.QDT,
    v_0=PF_results.voltages.V4,
    angle_0=PF_results.voltages.A4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={230,100})));
  Electrical.Buses.Bus Bus5(
    V_b=400,
    v_0=PF_results.voltages.V5,
    angle_0=PF_results.voltages.A5,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={-130,-70})));
  Electrical.Buses.Bus Bus6(
    V_b=400,
    v_0=PF_results.voltages.V6,
    angle_0=PF_results.voltages.A6,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={-10,-70})));
  Electrical.Branches.PwLine LoadLine(
    R=0.2686,
    X=0.089300,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=270,
        origin={-10,0})));
  Electrical.Events.Breaker BreakerGrid(enableTrigger=false) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-170,100})));
  inner Data.PF_results PF_results(
    redeclare record Voltages =
        OpenIPSL.Examples.Microgrids.IEEEMicrogrid.Data.VoltagesMicrogrid,
    redeclare record Machines =
        OpenIPSL.Examples.Microgrids.IEEEMicrogrid.Data.MachinesMicrogrid,
    redeclare record Loads =
        OpenIPSL.Examples.Microgrids.IEEEMicrogrid.Data.LoadsMicrogrid)
    annotation (Placement(transformation(extent={{-242,160},{-218,184}})));
  Electrical.Branches.PwLine LoadLine1(
    R=0.2686,
    X=0.089300,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=270,
        origin={140,-2})));
  Electrical.Buses.Bus Bus7(
    V_b=400,
    v_0=PF_results.voltages.V7,
    angle_0=PF_results.voltages.A7,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={140,-70})));
  Electrical.Renewables.PSSE.PV PV(
    M_b=80000,
    V_b=400,
    P_0=PF_results.machines.PPV,
    Q_0=PF_results.machines.QPV,
    v_0=PF_results.voltages.V4,
    angle_0=PF_results.voltages.A4,
    QFunctionality=0,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1
      RenewableGenerator,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECB1
      RenewableController,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.PlantController.REPCA1
      PlantController)
    annotation (Placement(transformation(extent={{240,120},{220,140}})));
  Electrical.Renewables.PSSE.BESS BESS(
    M_b=20000,
    V_b=400,
    P_0=PF_results.machines.PBESS,
    Q_0=PF_results.machines.QBESS,
    v_0=PF_results.voltages.V4,
    angle_0=PF_results.voltages.A4,
    QFunctionality=0,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1
      RenewableGenerator,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECCU1
      RenewableController,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.PlantController.REPCA1
      PlantController)
    annotation (Placement(transformation(extent={{240,60},{220,80}})));
  Electrical.Events.Breaker          breaker4(
    enableTrigger=false,
    t_o=0,
    rc_enabled=true,
    t_rc=5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={110,-110})));
equation
  connect(Transformer.p, Bus2.p)
    annotation (Line(points={{-78,100},{-60,100}}, color={0,0,255}));
  connect(Transformer.n, Bus1.p)
    annotation (Line(points={{-122,100},{-140,100}}, color={0,0,255}));
  connect(substation_line_2.p, Bus4.p) annotation (Line(points={{100.8,120},{
          118,120},{118,100},{140,100}}, color={0,0,255}));
  connect(substation_line_3.p, Bus4.p) annotation (Line(points={{100.8,80},{118,
          80},{118,100},{140,100}}, color={0,0,255}));
  connect(substation_line_2.n, Bus3.p) annotation (Line(points={{79.2,120},{62,
          120},{62,100},{40,100}}, color={0,0,255}));
  connect(substation_line_3.n, Bus3.p) annotation (Line(points={{79.2,80},{62,
          80},{62,100},{40,100}}, color={0,0,255}));
  connect(Fault2.p, Bus3.p) annotation (Line(points={{78.3333,150},{56,150},{56,
          100},{40,100}}, color={0,0,255}));
  connect(substation_line_1.p, Bus3.p) annotation (Line(points={{0.8,120},{18,
          120},{18,100},{40,100}}, color={0,0,255}));
  connect(substation_line_4.p, Bus3.p) annotation (Line(points={{0.8,80},{18,80},
          {18,100},{40,100}}, color={0,0,255}));
  connect(substation_line_1.n, Bus2.p) annotation (Line(points={{-20.8,120},{-38,
          120},{-38,100},{-60,100}}, color={0,0,255}));
  connect(substation_line_4.n, Bus2.p) annotation (Line(points={{-20.8,80},{-38,
          80},{-38,100},{-60,100}}, color={0,0,255}));
  connect(Fault1.p, Bus2.p) annotation (Line(points={{-21.6667,150},{-46,150},{
          -46,100},{-60,100}}, color={0,0,255}));
  connect(Diesel.pwPin, Bus4.p)
    annotation (Line(points={{219,100},{140,100}}, color={0,0,255}));
  connect(capacitor_bank.p, breaker.s)
    annotation (Line(points={{-190,-140},{-190,-130}}, color={0,0,255}));
  connect(capacitor_bank1.p, breaker1.s)
    annotation (Line(points={{-150,-140},{-150,-130}}, color={0,0,255}));
  connect(capacitor_bank2.p, breaker2.s)
    annotation (Line(points={{-110,-140},{-110,-130}}, color={0,0,255}));
  connect(capacitor_bank3.p, breaker3.s)
    annotation (Line(points={{-70,-140},{-70,-130}}, color={0,0,255}));
  connect(breaker.r, Bus5.p) annotation (Line(points={{-190,-110},{-190,-92},{-130,
          -92},{-130,-70}}, color={0,0,255}));
  connect(breaker1.r, Bus5.p) annotation (Line(points={{-150,-110},{-150,-92},{
          -130,-92},{-130,-70}}, color={0,0,255}));
  connect(breaker2.r, Bus5.p) annotation (Line(points={{-110,-110},{-110,-92},{
          -130,-92},{-130,-70}}, color={0,0,255}));
  connect(breaker3.r, Bus5.p) annotation (Line(points={{-70,-110},{-70,-92},{-130,
          -92},{-130,-70}}, color={0,0,255}));
  connect(Bus5.p, Bus4.p) annotation (Line(points={{-130,-70},{-130,60},{140,60},
          {140,100}}, color={0,0,255}));
  connect(load.p, Bus6.p)
    annotation (Line(points={{-10,-140},{-10,-70}}, color={0,0,255}));
  connect(Bus6.p, LoadLine.n)
    annotation (Line(points={{-10,-70},{-10,-10.8}}, color={0,0,255}));
  connect(BreakerGrid.r, Bus1.p)
    annotation (Line(points={{-160,100},{-140,100}}, color={0,0,255}));
  connect(BreakerGrid.s, GRID.p)
    annotation (Line(points={{-180,100},{-200,100}}, color={0,0,255}));
  connect(LoadLine.p, Bus4.p) annotation (Line(points={{-10,10.8},{-10,60},{140,
          60},{140,100}}, color={0,0,255}));
  connect(LoadLine1.p, Bus4.p)
    annotation (Line(points={{140,8.8},{140,100}}, color={0,0,255}));
  connect(LoadLine1.n, Bus7.p)
    annotation (Line(points={{140,-12.8},{140,-70}}, color={0,0,255}));
  connect(BESS.pwPin, Bus4.p) annotation (Line(points={{220,70},{180,70},{180,
          100},{140,100}}, color={0,0,255}));
  connect(PV.pwPin, Bus4.p) annotation (Line(points={{220,130},{180,130},{180,
          100},{140,100}}, color={0,0,255}));
  connect(breaker4.r, Bus7.p) annotation (Line(points={{110,-100},{110,-90},{
          140,-90},{140,-70}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -200},{260,200}})),
                          Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-260,-200},{260,200}}), graphics={
        Text(
          extent={{-152,142},{-130,130}},
          textColor={28,108,200},
          textString="(1)"),
        Text(
          extent={{-72,142},{-50,130}},
          textColor={28,108,200},
          textString="(2)"),
        Text(
          extent={{28,142},{50,130}},
          textColor={28,108,200},
          textString="(3)"),
        Text(
          extent={{128,142},{150,130}},
          textColor={28,108,200},
          textString="(4)"),
        Text(
          extent={{6,-64},{28,-76}},
          textColor={28,108,200},
          textString="(6)"),
        Text(
          extent={{-116,-64},{-94,-76}},
          textColor={28,108,200},
          textString="(5)"),
        Text(
          extent={{158,-64},{180,-76}},
          textColor={28,108,200},
          textString="(7)")}),
    experiment(
      StopTime=100,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Dassl"));
end IEEEMicrogrid_3;
