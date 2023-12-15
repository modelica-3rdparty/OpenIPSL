within OpenIPSL.Examples.Microgrids.IEEEMicrogrid;
model IEEEMicrogrid
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Buses.Bus CentralBus(
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
  OpenIPSL.Electrical.Buses.Bus SubBus(
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
  OpenIPSL.Electrical.Buses.Bus LVBus(
    V_b=400,
    v_0=PF_results.voltages.V3,
    angle_0=PF_results.voltages.A3,
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
  OpenIPSL.Electrical.Buses.Bus HVBus(
    V_b=11000,
    v_0=PF_results.voltages.V2,
    angle_0=PF_results.voltages.A2,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={-140,100})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS GRID(
    V_b=11000,
    v_0=PF_results.voltages.V1,
    angle_0=PF_results.voltages.A1,
    P_0=PF_results.machines.PInf,
    Q_0=PF_results.machines.QInf,
    R_a=0,
    X_d=1)
    annotation (Placement(transformation(extent={{-240,80},{-200,120}})));

  inner OpenIPSL.Electrical.SystemBase SysData(fn=60)
    annotation (Placement(transformation(extent={{-208,160},{-168,180}})));
    //Q_0=pf_results.machines.Q1_1,
    //P_0=pf_results.machines.P1_1,
  OpenIPSL.Electrical.Events.PwFault Fault1(
    R=0.01,
    X=0.1,
    t1=10,
    t2=10.3) annotation (Placement(transformation(extent={{-20,140},{0,160}})));
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
  Electrical.Buses.Bus CapBus(
    V_b=400,
    v_0=PF_results.voltages.V6,
    angle_0=PF_results.voltages.A6,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={-130,-70})));
  Electrical.Buses.Bus LoadBus(
    V_b=400,
    v_0=PF_results.voltages.V5,
    angle_0=PF_results.voltages.A5,
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
  Electrical.Buses.Bus MotorBus(
    V_b=400,
    v_0=PF_results.voltages.V5,
    angle_0=PF_results.voltages.A5,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={140,-70})));
  Electrical.Controls.VariableSpeedDrive.PowerElectronics.AC2DCandDC2AC
    aC2DCandDC2AC
    annotation (Placement(transformation(extent={{100,-126},{80,-106}})));
  Electrical.Controls.VariableSpeedDrive.ControllerLogic.VoltsHertzController
    voltsHertzController
    annotation (Placement(transformation(extent={{100,-166},{80,-146}})));
  Electrical.Machines.PSSE.CIM5 Motor1(M_b=50000)
    annotation (Placement(transformation(extent={{40,-126},{60,-106}})));
  Electrical.Machines.PSSE.CIM5 Motor2(
    M_b=50000,                         Sup=false, Ctrl=false)
    annotation (Placement(transformation(extent={{220,-126},{200,-106}})));
  Modelica.Blocks.Sources.Ramp Sync_Speed(
    height=0.9*(2*Modelica.Constants.pi*SysData.fn),
    duration=5,
    offset=0.1*(2*Modelica.Constants.pi*SysData.fn),
    startTime=0)
    annotation (Placement(transformation(extent={{140,-166},{120,-146}})));
  Electrical.Renewables.PSSE.PV PV
    annotation (Placement(transformation(extent={{240,120},{220,140}})));
  Electrical.Renewables.PSSE.BESS BESS
    annotation (Placement(transformation(extent={{240,60},{220,80}})));
equation
  connect(Transformer.p, LVBus.p)
    annotation (Line(points={{-78,100},{-60,100}}, color={0,0,255}));
  connect(Transformer.n, HVBus.p)
    annotation (Line(points={{-122,100},{-140,100}}, color={0,0,255}));
  connect(substation_line_2.p, CentralBus.p) annotation (Line(points={{100.8,
          120},{118,120},{118,100},{140,100}}, color={0,0,255}));
  connect(substation_line_3.p, CentralBus.p) annotation (Line(points={{100.8,80},
          {118,80},{118,100},{140,100}}, color={0,0,255}));
  connect(substation_line_2.n, SubBus.p) annotation (Line(points={{79.2,120},{
          62,120},{62,100},{40,100}}, color={0,0,255}));
  connect(substation_line_3.n, SubBus.p) annotation (Line(points={{79.2,80},{62,
          80},{62,100},{40,100}}, color={0,0,255}));
  connect(Fault2.p, SubBus.p) annotation (Line(points={{78.3333,150},{56,150},{
          56,100},{40,100}}, color={0,0,255}));
  connect(substation_line_1.p, SubBus.p) annotation (Line(points={{0.8,120},{18,
          120},{18,100},{40,100}}, color={0,0,255}));
  connect(substation_line_4.p, SubBus.p) annotation (Line(points={{0.8,80},{18,
          80},{18,100},{40,100}}, color={0,0,255}));
  connect(substation_line_1.n, LVBus.p) annotation (Line(points={{-20.8,120},{
          -38,120},{-38,100},{-60,100}}, color={0,0,255}));
  connect(substation_line_4.n, LVBus.p) annotation (Line(points={{-20.8,80},{
          -38,80},{-38,100},{-60,100}}, color={0,0,255}));
  connect(Fault1.p, LVBus.p) annotation (Line(points={{-21.6667,150},{-46,150},
          {-46,100},{-60,100}}, color={0,0,255}));
  connect(Diesel.pwPin, CentralBus.p)
    annotation (Line(points={{219,100},{140,100}}, color={0,0,255}));
  connect(capacitor_bank.p, breaker.s)
    annotation (Line(points={{-190,-140},{-190,-130}}, color={0,0,255}));
  connect(capacitor_bank1.p, breaker1.s)
    annotation (Line(points={{-150,-140},{-150,-130}}, color={0,0,255}));
  connect(capacitor_bank2.p, breaker2.s)
    annotation (Line(points={{-110,-140},{-110,-130}}, color={0,0,255}));
  connect(capacitor_bank3.p, breaker3.s)
    annotation (Line(points={{-70,-140},{-70,-130}}, color={0,0,255}));
  connect(breaker.r, CapBus.p) annotation (Line(points={{-190,-110},{-190,-92},
          {-130,-92},{-130,-70}}, color={0,0,255}));
  connect(breaker1.r, CapBus.p) annotation (Line(points={{-150,-110},{-150,-92},
          {-130,-92},{-130,-70}}, color={0,0,255}));
  connect(breaker2.r, CapBus.p) annotation (Line(points={{-110,-110},{-110,-92},
          {-130,-92},{-130,-70}}, color={0,0,255}));
  connect(breaker3.r, CapBus.p) annotation (Line(points={{-70,-110},{-70,-92},{
          -130,-92},{-130,-70}}, color={0,0,255}));
  connect(CapBus.p, CentralBus.p) annotation (Line(points={{-130,-70},{-130,60},
          {140,60},{140,100}}, color={0,0,255}));
  connect(load.p, LoadBus.p)
    annotation (Line(points={{-10,-140},{-10,-70}},  color={0,0,255}));
  connect(LoadBus.p, LoadLine.n)
    annotation (Line(points={{-10,-70},{-10,-10.8}},  color={0,0,255}));
  connect(BreakerGrid.r, HVBus.p)
    annotation (Line(points={{-160,100},{-140,100}}, color={0,0,255}));
  connect(BreakerGrid.s, GRID.p)
    annotation (Line(points={{-180,100},{-200,100}}, color={0,0,255}));
  connect(LoadLine.p, CentralBus.p) annotation (Line(points={{-10,10.8},{-10,60},
          {140,60},{140,100}},                           color={0,0,255}));
  connect(LoadLine1.p, CentralBus.p)
    annotation (Line(points={{140,8.8},{140,100}},  color={0,0,255}));
  connect(LoadLine1.n, MotorBus.p)
    annotation (Line(points={{140,-12.8},{140,-70}},        color={0,0,255}));
  connect(Motor2.p, MotorBus.p)
    annotation (Line(points={{200,-116},{140,-116},{140,-70}},
                                                           color={0,0,255}));
  connect(voltsHertzController.Vc, aC2DCandDC2AC.Vc)
    annotation (Line(points={{96,-144},{96,-128}}, color={0,0,127}));
  connect(voltsHertzController.m, aC2DCandDC2AC.m_input)
    annotation (Line(points={{84,-144},{84,-128}}, color={0,0,127}));
  connect(Motor1.wr, voltsHertzController.motor_speed)
    annotation (Line(points={{56,-128},{56,-152},{78,-152}}, color={0,0,127}));
  connect(voltsHertzController.we, Motor1.we)
    annotation (Line(points={{78,-160},{44,-160},{44,-128}}, color={0,0,127}));
  connect(Motor1.p, aC2DCandDC2AC.n)
    annotation (Line(points={{60,-116},{80,-116}}, color={0,0,255}));
  connect(aC2DCandDC2AC.p, MotorBus.p) annotation (Line(points={{100,-116},{140,
          -116},{140,-70}}, color={0,0,255}));
  connect(Sync_Speed.y, voltsHertzController.W_ref)
    annotation (Line(points={{119,-156},{102,-156}}, color={0,0,127}));
  connect(BESS.pwPin, CentralBus.p) annotation (Line(points={{220,70},{180,70},
          {180,100},{140,100}}, color={0,0,255}));
  connect(PV.pwPin, CentralBus.p) annotation (Line(points={{220,130},{180,130},
          {180,100},{140,100}}, color={0,0,255}));
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
      StopTime=20,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end IEEEMicrogrid;
