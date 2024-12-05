within OpenIPSL.Electrical.Controls;
package IEEE_CIGRE "This"
  package GFM "gfm_dll"
    class GFM_DLL
    extends ExternalObject;

    function constructor
      input Real c_filt;
      input Real r_filt;
      input Real l_filt;
      input Real r_l;
      input Real Vbase;
      input Real Sbase;
      input Real VDC_base;
      input Real w_type;
      output GFM_DLL gfm_dll;
      external "C" gfm_dll = init_gfm_model(c_filt,r_filt,l_filt,r_l,Vbase,Sbase,
                                            VDC_base,w_type) annotation (Library="GFM_GFL_IBR",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end constructor;

    function destructor
      input GFM_DLL gfm_dll;
      external "C" deinit_gfm_model(gfm_dll) annotation (Library="GFM_GFL_IBR",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end destructor;

      annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                lineColor={255,0,0}), Text(
              extent={{-100,44},{98,-104}},
              textColor={238,46,47},
              textString="Class
")}));
    end GFM_DLL;

    model GFM_GFL_IBR

      Real out[12];
      //Real get_time_result;
      parameter Modelica.Units.SI.Capacitance c_filter = 0.0000627830 "Filter Capacitance";
      parameter Modelica.Units.SI.Resistance r_damp = 845 "Damping Resistance";
      parameter Modelica.Units.SI.Inductance l_filter = 0.0008965728461 "Filter Inductance";
      parameter Modelica.Units.SI.Resistance r_l = 0.021125 "Inductor Resistance";
      parameter Real Vbase = 6.5 "kV";
      parameter Real Sbase = 10 "MVA";
      parameter Real VDC_base = 13 "kV";
      parameter Real w_type = 1 "0 - PLL, 1 - Droop";
      GFM_DLL gfm_struct = GFM_DLL(c_filter,r_damp,l_filter,r_l,Vbase,Sbase,VDC_base,w_type);

      Modelica.Electrical.Analog.Basic.Resistor resistor(R=r_l)
        annotation (Placement(transformation(extent={{-30,4},{-18,16}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor(i(start=0, fixed=true), L=
            l_filter) annotation (Placement(transformation(extent={{-10,4},{2,16}})));
      Modelica.Electrical.Analog.Basic.Capacitor c_b(v(start=0, fixed=false), C=
            c_filter) annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={20,-26})));
      Modelica.Electrical.Analog.Basic.Resistor r_b(R=r_damp) annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={52,-26})));
      Modelica.Electrical.Analog.Basic.Capacitor c_c(v(start=0, fixed=false), C=
            c_filter) annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={30,-26})));
      Modelica.Electrical.Analog.Basic.Resistor r_c(R=r_damp) annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={62,-26})));
      Modelica.Electrical.Analog.Basic.Capacitor c_a(v(start=0, fixed=false), C=
            c_filter) annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={10,-26})));
      Modelica.Electrical.Analog.Basic.Resistor r_a(R=r_damp) annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={42,-26})));
      Modelica.Electrical.Analog.Basic.Resistor resistor4(R=r_l)
        annotation (Placement(transformation(extent={{-26,-6},{-14,6}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start=0, fixed=true), L
          =l_filter) annotation (Placement(transformation(extent={{-6,-6},{6,6}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor5(R=r_l)
        annotation (Placement(transformation(extent={{-22,-16},{-10,-4}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start=0, fixed=true), L
          =l_filter)
        annotation (Placement(transformation(extent={{-2,-16},{10,-4}})));
      tools.votlage_current_sensor bridge_sensor_c
        annotation (Placement(transformation(extent={{-48,8},{-38,12}})));
      tools.votlage_current_sensor bridge_sensor_b
        annotation (Placement(transformation(extent={{-48,-2},{-38,2}})));
      tools.votlage_current_sensor bridge_sensor_a
        annotation (Placement(transformation(extent={{-48,-12},{-38,-8}})));
      tools.votlage_current_sensor grid_sensor_c
        annotation (Placement(transformation(extent={{68,8},{78,12}})));
      tools.votlage_current_sensor grid_sensor_b
        annotation (Placement(transformation(extent={{68,-2},{78,2}})));
      tools.votlage_current_sensor grid_sensor_a
        annotation (Placement(transformation(extent={{68,-12},{78,-8}})));
      Modelica.Electrical.Analog.Sources.SignalVoltage phase_c annotation (
          Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={-78,-22})));
      Modelica.Electrical.Analog.Sources.SignalVoltage phase_b annotation (
          Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={-66,-22})));
      Modelica.Electrical.Analog.Sources.SignalVoltage phase_a annotation (
          Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={-54,-22})));
      Modelica.Electrical.Analog.Basic.Ground ground2
        annotation (Placement(transformation(extent={{-72,-56},{-60,-44}})));
      Modelica.Electrical.Analog.Basic.Ground ground1
        annotation (Placement(transformation(extent={{30,-62},{42,-50}})));

      Modelica.Electrical.Analog.Interfaces.NegativePin n annotation (Placement(
            transformation(rotation=0, extent={{90,-70},{110,-50}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation (Placement(
            transformation(rotation=0, extent={{90,-10},{110,10}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation (Placement(
            transformation(rotation=0, extent={{90,50},{110,70}})));
      Modelica.Blocks.Interfaces.RealInput P_ref_pu
        annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
      Modelica.Blocks.Interfaces.RealInput Q_ref_pu
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
      Modelica.Blocks.Interfaces.RealInput V_ref_pu
        annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
    algorithm

      Functions.update(
        gfm_struct,
        time,
        grid_sensor_a.voltage,
        grid_sensor_b.voltage,
        grid_sensor_c.voltage,
        grid_sensor_a.current,
        grid_sensor_b.current,
        grid_sensor_c.current,
        bridge_sensor_a.current,
        bridge_sensor_b.current,
        bridge_sensor_c.current,
        P_ref_pu,
        Q_ref_pu,
        V_ref_pu);

      out :=Functions.model_output(gfm_struct);
      phase_a.v :=out[1];
      phase_b.v :=out[2];
      phase_c.v :=out[3];
      when terminal() then
        Functions.save_ss_state(gfm_struct);
        Modelica.Utilities.Streams.print("Saved states in list.dat");
      end when;
    equation
      connect(resistor.n,inductor. p)
        annotation (Line(points={{-18,10},{-10,10}},
                                                  color={0,0,255}));
      connect(resistor4.n,inductor1. p)
        annotation (Line(points={{-14,0},{-6,0}},
                                                color={0,0,255}));
      connect(resistor5.n,inductor2. p)
        annotation (Line(points={{-10,-10},{-2,-10}},
                                                    color={0,0,255}));
      connect(c_a.p,inductor2. n)
        annotation (Line(points={{10,-20},{10,-10}}, color={0,0,255}));
      connect(resistor.p,bridge_sensor_c. n)
        annotation (Line(points={{-30,10},{-38,10}}, color={0,0,255}));
      connect(bridge_sensor_b.n,resistor4. p)
        annotation (Line(points={{-38,0},{-26,0}}, color={0,0,255}));
      connect(resistor5.p,bridge_sensor_a. n)
        annotation (Line(points={{-22,-10},{-38,-10}}, color={0,0,255}));
      connect(inductor.n,grid_sensor_c. p)
        annotation (Line(points={{2,10},{68,10}},  color={0,0,255}));
      connect(inductor1.n,grid_sensor_b. p)
        annotation (Line(points={{6,0},{68,0}},  color={0,0,255}));
      connect(inductor2.n,grid_sensor_a. p)
        annotation (Line(points={{10,-10},{68,-10}}, color={0,0,255}));
      connect(c_b.p,grid_sensor_b. p)
        annotation (Line(points={{20,-20},{20,0},{68,0}}, color={0,0,255}));
      connect(c_c.p,grid_sensor_c. p)
        annotation (Line(points={{30,-20},{30,10},{68,10}}, color={0,0,255}));
      connect(phase_b.n,ground2. p)
        annotation (Line(points={{-66,-28},{-66,-44}}, color={0,0,255}));
      connect(phase_c.n,ground2. p) annotation (Line(points={{-78,-28},{-78,-40},{-66,
              -40},{-66,-44}}, color={0,0,255}));
      connect(phase_a.n,ground2. p) annotation (Line(points={{-54,-28},{-54,-40},{-66,
              -40},{-66,-44}}, color={0,0,255}));
      connect(phase_a.p,bridge_sensor_a. p)
        annotation (Line(points={{-54,-16},{-48,-16},{-48,-10}}, color={0,0,255}));
      connect(phase_b.p,bridge_sensor_b. p)
        annotation (Line(points={{-66,-16},{-66,0},{-48,0}}, color={0,0,255}));
      connect(phase_c.p,bridge_sensor_c. p)
        annotation (Line(points={{-78,-16},{-78,10},{-48,10}}, color={0,0,255}));
      connect(r_c.p,grid_sensor_c. p)
        annotation (Line(points={{62,-20},{62,10},{68,10}}, color={0,0,255}));
      connect(r_b.p,grid_sensor_b. p)
        annotation (Line(points={{52,-20},{52,0},{68,0}}, color={0,0,255}));
      connect(r_a.p,grid_sensor_a. p)
        annotation (Line(points={{42,-20},{42,-10},{68,-10}}, color={0,0,255}));
      connect(c_a.n,r_c. n) annotation (Line(points={{10,-32},{10,-36},{62,-36},{62,
              -32}}, color={0,0,255}));
      connect(c_b.n,r_c. n) annotation (Line(points={{20,-32},{20,-36},{62,-36},{62,
              -32}}, color={0,0,255}));
      connect(c_c.n,r_c. n) annotation (Line(points={{30,-32},{30,-36},{62,-36},{62,
              -32}}, color={0,0,255}));
      connect(r_a.n,r_c. n) annotation (Line(points={{42,-32},{42,-36},{62,-36},{62,
              -32}}, color={0,0,255}));
      connect(r_b.n,r_c. n) annotation (Line(points={{52,-32},{52,-36},{62,-36},{62,
              -32}}, color={0,0,255}));
      connect(ground1.p,r_c. n) annotation (Line(points={{36,-50},{36,-36},{62,-36},
              {62,-32}}, color={0,0,255}));
      connect(n, grid_sensor_a.n)
        annotation (Line(points={{100,-60},{84,-60},{84,-10},{78,-10}},
                                                                color={0,0,255}));
      connect(n1, grid_sensor_b.n)
        annotation (Line(points={{100,0},{78,0}},           color={0,0,255}));
      connect(n2, grid_sensor_c.n)
        annotation (Line(points={{100,60},{84,60},{84,10},{78,10}},
                                                               color={0,0,255}));
      annotation (Icon(graphics={
            Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
            Line(points={{-100,100},{100,-100}}, color={28,108,200}),
            Text(
              extent={{-14,82},{78,16}},
              textColor={28,108,200},
              textString="AC"),
            Text(
              extent={{-74,-14},{18,-80}},
              textColor={28,108,200},
              textString="DC")}));
    end GFM_GFL_IBR;

    package Functions
    function my_add_c
      input Real a;
      input Real b;
      output Real sum;
      external "C" sum = my_add(a,b) annotation (Library="GFM_GFL_IBR",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end my_add_c;

    function save_ss_state
      input GFM_DLL gfm_dll;
      external "C" save_states(gfm_dll) annotation (Library="GFM_GFL_IBR",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end save_ss_state;

    function load_ss_state
      input GFM_DLL gfm_dll;
      output Real x;
      external "C" x = load_states(gfm_dll) annotation (Library="GFM_GFL_IBR",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end load_ss_state;

      function update
        input GFM_DLL gfm_dll;
        input Real t;
        input Real va;
        input Real vb;
        input Real vc;
        input Real ia;
        input Real ib;
        input Real ic;
        input Real ial;
        input Real ibl;
        input Real icl;
        input Real pref;
        input Real qref;
        input Real vref;
        external "C" update_gfm_input(gfm_dll,t,va,vb,vc,ia,ib,ic,ial,ibl,icl,pref,qref,vref) annotation (Library="GFM_GFL_IBR",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end update;

      function model_output
        input GFM_DLL gfm_dll;
        output Real out[12];
        external "C" model_calculate(gfm_dll, out) annotation (Library="GFM_GFL_IBR",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end model_output;

      function get_time
        output Real out;
        external "C" out = get_sim_time() annotation (Library="GFM_GFL_IBR",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end get_time;
    end Functions;

    package tools
    model dq0_tf
      constant Real pi = Modelica.Constants.pi;
      Modelica.Blocks.Interfaces.RealInput a
        annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
      Modelica.Blocks.Interfaces.RealInput b
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
      Modelica.Blocks.Interfaces.RealInput c
        annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
      Modelica.Blocks.Interfaces.RealOutput d
        annotation (Placement(transformation(extent={{100,50},{120,70}})));
      Modelica.Blocks.Interfaces.RealOutput q
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Interfaces.RealOutput zero
        annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
      Modelica.Blocks.Interfaces.RealInput theta annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-100})));
    equation
      d = (2/3)*(a*sin(theta)+b*sin(theta-(2*pi)/(3))+c*sin(theta+(2*pi)/(3)));
      q = (2/3)*(a*cos(theta)+b*cos(theta-(2*pi)/(3))+c*cos(theta+(2*pi)/(3)));
      zero = (a+b+c)/3;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
            Line(points={{-100,-100},{100,100}}, color={28,108,200}),
            Text(
              extent={{-76,94},{28,22}},
              textColor={28,108,200},
              textString="ABC"),
            Text(
              extent={{-8,-6},{96,-78}},
              textColor={28,108,200},
              textString="dq0")}),                                   Diagram(
            coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
                extent={{-100,100},{100,-100}}, lineColor={28,108,200})}));
    end dq0_tf;

    model Vabc_source
      OpenIPSL.Interfaces.PwPin p
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Blocks.Interfaces.RealInput ref
        annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
      Modelica.Blocks.Interfaces.RealInput vin
        annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
    equation
      [p.vr; p.vi]=[0;0];
                          annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
                extent={{-100,100},{100,-100}}, lineColor={28,108,200})}));
    end Vabc_source;

    model votlage_current_sensor
      Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={20,-18})));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-20,0})));
      Modelica.Electrical.Analog.Interfaces.PositivePin p
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin n
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{10,-80},{30,-60}})));
      Modelica.Blocks.Interfaces.RealOutput current( start = 0) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-40,110})));
      Modelica.Blocks.Interfaces.RealOutput voltage( start = 0)   annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={40,110})));
    equation
      connect(currentSensor.p, p)
        annotation (Line(points={{-30,0},{-100,0}}, color={0,0,255}));
      connect(currentSensor.n, voltageSensor.p)
        annotation (Line(points={{-10,0},{20,0},{20,-8}}, color={0,0,255}));
      connect(n, voltageSensor.p)
        annotation (Line(points={{100,0},{20,0},{20,-8}}, color={0,0,255}));
      connect(ground.p, voltageSensor.n)
        annotation (Line(points={{20,-60},{20,-28}}, color={0,0,255}));
      connect(currentSensor.i, current) annotation (Line(points={{-20,-11},{-20,
              -14},{-40,-14},{-40,110}}, color={0,0,127}));
      connect(voltageSensor.v, voltage) annotation (Line(points={{9,-18},{0,-18},
              {0,40},{40,40},{40,110}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
            Text(
              extent={{-68,98},{-12,66}},
              textColor={28,108,200},
              textString="Current"),
            Text(
              extent={{12,98},{68,66}},
              textColor={28,108,200},
              textString="Voltage")}), Diagram(coordinateSystem(
              preserveAspectRatio=false)));
    end votlage_current_sensor;

    model votlage_current_sensor_no_init
      Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={20,-18})));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-20,0})));
      Modelica.Electrical.Analog.Interfaces.PositivePin p
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin n
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{10,-80},{30,-60}})));
      Modelica.Blocks.Interfaces.RealOutput current annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-40,110})));
      Modelica.Blocks.Interfaces.RealOutput voltage   annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={40,110})));
    equation
      connect(currentSensor.p, p)
        annotation (Line(points={{-30,0},{-100,0}}, color={0,0,255}));
      connect(currentSensor.n, voltageSensor.p)
        annotation (Line(points={{-10,0},{20,0},{20,-8}}, color={0,0,255}));
      connect(n, voltageSensor.p)
        annotation (Line(points={{100,0},{20,0},{20,-8}}, color={0,0,255}));
      connect(ground.p, voltageSensor.n)
        annotation (Line(points={{20,-60},{20,-28}}, color={0,0,255}));
      connect(currentSensor.i, current) annotation (Line(points={{-20,-11},{-20,
              -14},{-40,-14},{-40,110}}, color={0,0,127}));
      connect(voltageSensor.v, voltage) annotation (Line(points={{9,-18},{0,-18},
              {0,40},{40,40},{40,110}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
            Text(
              extent={{-68,98},{-12,66}},
              textColor={28,108,200},
              textString="Current"),
            Text(
              extent={{12,98},{68,66}},
              textColor={28,108,200},
              textString="Voltage")}), Diagram(coordinateSystem(
              preserveAspectRatio=false)));
    end votlage_current_sensor_no_init;

    end tools;

    package GridComponents
      model GridWithFault_Init
        parameter Modelica.Units.SI.Voltage Vbase=6500 "base voltage L-L RMS";
        parameter Real Vgrid = 1 "p.u.";
        parameter Real FaultVoltage = 0.7 "p.u.";
        parameter Modelica.Units.SI.Time FaultTime =5 "When fault happen";
        parameter Modelica.Units.SI.Time FaultDuration = 0.1 "for how long";
        parameter Modelica.Units.SI.Time StartTime = 0
                                                      "when to initialize model";
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-64,-78})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-30,-48})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-14,-18})));
        Modelica.Blocks.Sources.Sine sine(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=60,
          phase=2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-24})));
        Modelica.Blocks.Sources.Sine sine1(amplitude=sqrt(2)*Vbase/sqrt(3),f=60)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-54})));
        Modelica.Blocks.Sources.Sine sine2(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=60,
          phase=-2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-84})));
        Modelica.Electrical.Analog.Basic.Ground ground4
          annotation (Placement(transformation(extent={{-70,-106},{-58,-94}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}}),
              iconTransformation(extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p1 annotation (Placement(
              transformation(rotation=0, extent={{-110,-10},{-90,10}}),
              iconTransformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p2 annotation (Placement(
              transformation(rotation=0, extent={{-110,-70},{-90,-50}}),
              iconTransformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-76,-78})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-46,-48})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-24,-18})));
      equation
        connect(p, signalVoltage.p)
          annotation (Line(points={{-100,60},{-64,60},{-64,-68}}, color={0,0,255}));
        connect(p1, signalVoltage1.p)
          annotation (Line(points={{-100,0},{-30,0},{-30,-38}}, color={0,0,255}));
        connect(p2, signalVoltage2.p) annotation (Line(points={{-100,-60},{-78,-60},{-78,
                -4},{-14,-4},{-14,-8}}, color={0,0,255}));
        connect(signalVoltage2.n, ground4.p)
          annotation (Line(points={{-14,-28},{-14,-94},{-64,-94}}, color={0,0,255}));
        connect(signalVoltage1.n, ground4.p)
          annotation (Line(points={{-30,-58},{-30,-94},{-64,-94}}, color={0,0,255}));
        connect(signalVoltage.n, ground4.p)
          annotation (Line(points={{-64,-88},{-64,-94}}, color={0,0,255}));
        connect(resistor.n, signalVoltage.n)
          annotation (Line(points={{-76,-88},{-64,-88}}, color={0,0,255}));
        connect(resistor.p, signalVoltage.p)
          annotation (Line(points={{-76,-68},{-64,-68}}, color={0,0,255}));
        connect(resistor1.p, signalVoltage1.p)
          annotation (Line(points={{-46,-38},{-30,-38}}, color={0,0,255}));
        connect(resistor1.n, signalVoltage1.n)
          annotation (Line(points={{-46,-58},{-30,-58}}, color={0,0,255}));
        connect(resistor2.n, signalVoltage2.n)
          annotation (Line(points={{-24,-28},{-14,-28}}, color={0,0,255}));
        connect(resistor2.p, signalVoltage2.p)
          annotation (Line(points={{-24,-8},{-14,-8}}, color={0,0,255}));
        connect(signalVoltage2.v, sine.y) annotation (Line(points={{-2,-18},{68,
                -18},{68,-24},{73,-24}}, color={0,0,127}));
        connect(signalVoltage1.v, sine1.y) annotation (Line(points={{-18,-48},{68,
                -48},{68,-54},{73,-54}}, color={0,0,127}));
        connect(signalVoltage.v, sine2.y) annotation (Line(points={{-52,-78},{68,
                -78},{68,-84},{73,-84}}, color={0,0,127}));
        annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={0,0,255}), Text(
                extent={{-76,58},{88,-52}},
                textColor={0,0,255},
                textString="Grid")}));
      end GridWithFault_Init;

      model Line_R
        parameter Real Time = 1
                               "start";
        parameter Real Resistance = 0
                                     "line resistance";
        Modelica.Electrical.Analog.Interfaces.PositivePin p annotation (Placement(
              transformation(rotation=0, extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p1 annotation (Placement(
              transformation(rotation=0, extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p2 annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n annotation (Placement(
              transformation(rotation=0, extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation (Placement(
              transformation(rotation=0, extent={{90,-70},{110,-50}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation (Placement(
              transformation(rotation=0, extent={{90,50},{110,70}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=Resistance)
          annotation (Placement(transformation(extent={{-10,50},{10,70}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=Resistance)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=Resistance)
          annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
      equation
        connect(resistor.p, p2)
          annotation (Line(points={{-10,60},{-100,60}}, color={0,0,255}));
        connect(p, resistor1.p)
          annotation (Line(points={{-100,0},{-10,0}}, color={0,0,255}));
        connect(resistor2.p, p1)
          annotation (Line(points={{-10,-60},{-100,-60}}, color={0,0,255}));
        connect(resistor2.n, n1)
          annotation (Line(points={{10,-60},{100,-60}}, color={0,0,255}));
        connect(n, resistor1.n)
          annotation (Line(points={{100,0},{10,0}}, color={0,0,255}));
        connect(resistor.n, n2)
          annotation (Line(points={{10,60},{100,60}}, color={0,0,255}));
      end Line_R;

      model GFM_GFL_IBR_Init_SS

        Real out[12];
        //Real get_time_result;
        parameter Modelica.Units.SI.Capacitance c_filter = 0.0000627830 "Filter Capacitance";
        parameter Modelica.Units.SI.Resistance r_damp = 845 "Damping Resistance";
        parameter Modelica.Units.SI.Inductance l_filter = 0.0008965728461 "Filter Inductance";
        parameter Modelica.Units.SI.Resistance r_l = 0.021125 "Inductor Resistance";
        parameter Real Vbase = 6.5 "kV";
        parameter Real Sbase = 10 "MVA";
        parameter Real VDC_base = 13 "kV";
        parameter Real w_type = 1 "0 - PLL, 1 - Droop";
        GFM_DLL gfm_struct = GFM_DLL(c_filter,r_damp,l_filter,r_l,Vbase,Sbase,VDC_base,w_type);

        Modelica.Electrical.Analog.Basic.Resistor resistor(R=r_l)
          annotation (Placement(transformation(extent={{-30,4},{-18,16}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor(i(start=-122.771, fixed=true),
                                                                                   L=
              l_filter) annotation (Placement(transformation(extent={{-10,4},{2,16}})));
        Modelica.Electrical.Analog.Basic.Capacitor c_b(v(start=-5.41e-10, fixed=false),
                                                                                C=
              c_filter) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={20,-26})));
        Modelica.Electrical.Analog.Basic.Resistor r_b(R=r_damp) annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={52,-26})));
        Modelica.Electrical.Analog.Basic.Capacitor c_c(v(start=-4596.194, fixed=false),
                                                                                C=
              c_filter) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={30,-26})));
        Modelica.Electrical.Analog.Basic.Resistor r_c(R=r_damp) annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={62,-26})));
        Modelica.Electrical.Analog.Basic.Capacitor c_a(v(start=4596.194, fixed=false),
                                                                                C=
              c_filter) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={10,-26})));
        Modelica.Electrical.Analog.Basic.Resistor r_a(R=r_damp) annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={42,-26})));
        Modelica.Electrical.Analog.Basic.Resistor resistor4(R=r_l)
          annotation (Placement(transformation(extent={{-26,-6},{-14,6}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start=125.84578, fixed=true),
                                                                                    L
            =l_filter) annotation (Placement(transformation(extent={{-6,-6},{6,6}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor5(R=r_l)
          annotation (Placement(transformation(extent={{-22,-16},{-10,-4}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start=-3.074736, fixed=true),
                                                                                    L
            =l_filter)
          annotation (Placement(transformation(extent={{-2,-16},{10,-4}})));
        tools.votlage_current_sensor_no_init
                                     bridge_sensor_c
          annotation (Placement(transformation(extent={{-48,8},{-38,12}})));
        tools.votlage_current_sensor_no_init
                                     bridge_sensor_b
          annotation (Placement(transformation(extent={{-48,-2},{-38,2}})));
        tools.votlage_current_sensor_no_init
                                     bridge_sensor_a
          annotation (Placement(transformation(extent={{-48,-12},{-38,-8}})));
        tools.votlage_current_sensor_no_init
                                     grid_sensor_c
          annotation (Placement(transformation(extent={{68,8},{78,12}})));
        tools.votlage_current_sensor_no_init
                                     grid_sensor_b
          annotation (Placement(transformation(extent={{68,-2},{78,2}})));
        tools.votlage_current_sensor_no_init
                                     grid_sensor_a
          annotation (Placement(transformation(extent={{68,-12},{78,-8}})));
        Modelica.Electrical.Analog.Sources.SignalVoltage phase_c annotation (
            Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-78,-22})));
        Modelica.Electrical.Analog.Sources.SignalVoltage phase_b annotation (
            Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-66,-22})));
        Modelica.Electrical.Analog.Sources.SignalVoltage phase_a annotation (
            Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-54,-22})));
        Modelica.Electrical.Analog.Basic.Ground ground2
          annotation (Placement(transformation(extent={{-72,-56},{-60,-44}})));
        Modelica.Electrical.Analog.Basic.Ground ground1
          annotation (Placement(transformation(extent={{30,-62},{42,-50}})));

        Modelica.Electrical.Analog.Interfaces.NegativePin n annotation (Placement(
              transformation(rotation=0, extent={{90,-70},{110,-50}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation (Placement(
              transformation(rotation=0, extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation (Placement(
              transformation(rotation=0, extent={{90,50},{110,70}})));
        Modelica.Blocks.Interfaces.RealInput P_ref_pu
          annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
        Modelica.Blocks.Interfaces.RealInput Q_ref_pu
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
        Modelica.Blocks.Interfaces.RealInput V_ref_pu
          annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
      initial equation
        OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Functions.load_ss_state(gfm_struct);
      algorithm
        Functions.update(
          gfm_struct,
          time,
          grid_sensor_a.voltage,
          grid_sensor_b.voltage,
          grid_sensor_c.voltage,
          grid_sensor_a.current,
          grid_sensor_b.current,
          grid_sensor_c.current,
          bridge_sensor_a.current,
          bridge_sensor_b.current,
          bridge_sensor_c.current,
          P_ref_pu,
          Q_ref_pu,
          V_ref_pu);

        out :=Functions.model_output(gfm_struct);
        phase_a.v :=out[1];
        phase_b.v :=out[2];
        phase_c.v :=out[3];
        //Modelica.Utilities.Streams.print(String(time));
      equation
        connect(resistor.n,inductor. p)
          annotation (Line(points={{-18,10},{-10,10}},
                                                    color={0,0,255}));
        connect(resistor4.n,inductor1. p)
          annotation (Line(points={{-14,0},{-6,0}},
                                                  color={0,0,255}));
        connect(resistor5.n,inductor2. p)
          annotation (Line(points={{-10,-10},{-2,-10}},
                                                      color={0,0,255}));
        connect(c_a.p,inductor2. n)
          annotation (Line(points={{10,-20},{10,-10}}, color={0,0,255}));
        connect(resistor.p,bridge_sensor_c. n)
          annotation (Line(points={{-30,10},{-38,10}}, color={0,0,255}));
        connect(bridge_sensor_b.n,resistor4. p)
          annotation (Line(points={{-38,0},{-26,0}}, color={0,0,255}));
        connect(resistor5.p,bridge_sensor_a. n)
          annotation (Line(points={{-22,-10},{-38,-10}}, color={0,0,255}));
        connect(inductor.n,grid_sensor_c. p)
          annotation (Line(points={{2,10},{68,10}},  color={0,0,255}));
        connect(inductor1.n,grid_sensor_b. p)
          annotation (Line(points={{6,0},{68,0}},  color={0,0,255}));
        connect(inductor2.n,grid_sensor_a. p)
          annotation (Line(points={{10,-10},{68,-10}}, color={0,0,255}));
        connect(c_b.p,grid_sensor_b. p)
          annotation (Line(points={{20,-20},{20,0},{68,0}}, color={0,0,255}));
        connect(c_c.p,grid_sensor_c. p)
          annotation (Line(points={{30,-20},{30,10},{68,10}}, color={0,0,255}));
        connect(phase_b.n,ground2. p)
          annotation (Line(points={{-66,-28},{-66,-44}}, color={0,0,255}));
        connect(phase_c.n,ground2. p) annotation (Line(points={{-78,-28},{-78,-40},{-66,
                -40},{-66,-44}}, color={0,0,255}));
        connect(phase_a.n,ground2. p) annotation (Line(points={{-54,-28},{-54,-40},{-66,
                -40},{-66,-44}}, color={0,0,255}));
        connect(phase_a.p,bridge_sensor_a. p)
          annotation (Line(points={{-54,-16},{-48,-16},{-48,-10}}, color={0,0,255}));
        connect(phase_b.p,bridge_sensor_b. p)
          annotation (Line(points={{-66,-16},{-66,0},{-48,0}}, color={0,0,255}));
        connect(phase_c.p,bridge_sensor_c. p)
          annotation (Line(points={{-78,-16},{-78,10},{-48,10}}, color={0,0,255}));
        connect(r_c.p,grid_sensor_c. p)
          annotation (Line(points={{62,-20},{62,10},{68,10}}, color={0,0,255}));
        connect(r_b.p,grid_sensor_b. p)
          annotation (Line(points={{52,-20},{52,0},{68,0}}, color={0,0,255}));
        connect(r_a.p,grid_sensor_a. p)
          annotation (Line(points={{42,-20},{42,-10},{68,-10}}, color={0,0,255}));
        connect(c_a.n,r_c. n) annotation (Line(points={{10,-32},{10,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(c_b.n,r_c. n) annotation (Line(points={{20,-32},{20,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(c_c.n,r_c. n) annotation (Line(points={{30,-32},{30,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(r_a.n,r_c. n) annotation (Line(points={{42,-32},{42,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(r_b.n,r_c. n) annotation (Line(points={{52,-32},{52,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(ground1.p,r_c. n) annotation (Line(points={{36,-50},{36,-36},{62,-36},
                {62,-32}}, color={0,0,255}));
        connect(n, grid_sensor_a.n)
          annotation (Line(points={{100,-60},{84,-60},{84,-10},{78,-10}},
                                                                  color={0,0,255}));
        connect(n1, grid_sensor_b.n)
          annotation (Line(points={{100,0},{78,0}},           color={0,0,255}));
        connect(n2, grid_sensor_c.n)
          annotation (Line(points={{100,60},{84,60},{84,10},{78,10}},
                                                                 color={0,0,255}));
        annotation (Icon(graphics={
              Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
              Line(points={{-100,100},{100,-100}}, color={28,108,200}),
              Text(
                extent={{-14,82},{78,16}},
                textColor={28,108,200},
                textString="AC"),
              Text(
                extent={{-74,-14},{18,-80}},
                textColor={28,108,200},
                textString="DC")}));
      end GFM_GFL_IBR_Init_SS;

      model Line_L
        parameter Real Time = 1
                               "start";
        parameter Real Inductance = 0
                                     "line inductance";
        parameter Real Resistance = 0
                                     "line resistance";
        Modelica.Electrical.Analog.Interfaces.PositivePin p annotation (Placement(
              transformation(rotation=0, extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p1 annotation (Placement(
              transformation(rotation=0, extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p2 annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n annotation (Placement(
              transformation(rotation=0, extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation (Placement(
              transformation(rotation=0, extent={{90,-70},{110,-50}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation (Placement(
              transformation(rotation=0, extent={{90,50},{110,70}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor(L=Inductance)
          annotation (Placement(transformation(extent={{-12,10},{8,30}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor1(L=Inductance)
          annotation (Placement(transformation(extent={{-10,-34},{10,-14}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor2(L=Inductance)
          annotation (Placement(transformation(extent={{-10,-92},{10,-72}})));
      equation
        connect(p2, inductor.p) annotation (Line(points={{-100,60},{-18,60},{-18,
                20},{-12,20}}, color={0,0,255}));
        connect(p, inductor1.p) annotation (Line(points={{-100,0},{-16,0},{-16,
                -24},{-10,-24}}, color={0,0,255}));
        connect(p1, inductor2.p) annotation (Line(points={{-100,-60},{-16,-60},{
                -16,-82},{-10,-82}}, color={0,0,255}));
        connect(inductor.n, n2) annotation (Line(points={{8,20},{86,20},{86,60},{
                100,60}}, color={0,0,255}));
        connect(n, inductor1.n) annotation (Line(points={{100,0},{16,0},{16,-24},
                {10,-24}}, color={0,0,255}));
        connect(n1, inductor2.n) annotation (Line(points={{100,-60},{16,-60},{16,
                -82},{10,-82}}, color={0,0,255}));
      end Line_L;

      model GridWithFault
        parameter Modelica.Units.SI.Voltage Vbase=6500 "base voltage L-L RMS";
        parameter Real Vgrid = 1 "p.u.";
        parameter Real FaultVoltage = 0.7 "p.u.";
        parameter Modelica.Units.SI.Time FaultTime =5 "When fault happen";
        parameter Modelica.Units.SI.Time FaultDuration = 0.1 "for how long";
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-64,-78})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-30,-48})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-14,-18})));
        Modelica.Blocks.Sources.Sine sine(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=60,
          phase=2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-24})));
        Modelica.Blocks.Sources.Sine sine1(amplitude=sqrt(2)*Vbase/sqrt(3),f=60)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-54})));
        Modelica.Blocks.Sources.Sine sine2(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=60,
          phase=-2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-84})));
        Modelica.Electrical.Analog.Basic.Ground ground4
          annotation (Placement(transformation(extent={{-70,-106},{-58,-94}})));
        Modelica.Blocks.Sources.Step step1(
          height=FaultVoltage - Vgrid,
          offset=Vgrid,
          startTime=FaultTime)
                       annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={28,82})));
        Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={18,-18})));
        Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={18,-48})));
        Modelica.Blocks.Math.Product product3 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={18,-78})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder(
          k=1,
          T=0.0001,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={44,18})));
        Modelica.Blocks.Sources.Step step2(
          height=Vgrid - FaultVoltage,
          offset=0,
          startTime=FaultTime + FaultDuration)
                         annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={60,82})));
        Modelica.Blocks.Math.Add add annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={44,46})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}}),
              iconTransformation(extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p1 annotation (Placement(
              transformation(rotation=0, extent={{-110,-10},{-90,10}}),
              iconTransformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p2 annotation (Placement(
              transformation(rotation=0, extent={{-110,-70},{-90,-50}}),
              iconTransformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-76,-78})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-46,-48})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-24,-18})));
      equation
        connect(product1.u1,sine. y)
          annotation (Line(points={{30,-24},{73,-24}},     color={0,0,127}));
        connect(product2.u1,sine1. y)
          annotation (Line(points={{30,-54},{73,-54}},     color={0,0,127}));
        connect(product3.u1,sine2. y)
          annotation (Line(points={{30,-84},{73,-84}},     color={0,0,127}));
        connect(product1.y,signalVoltage2. v) annotation (Line(points={{7,-18},{-2,-18}},
                                            color={0,0,127}));
        connect(product2.y,signalVoltage1. v) annotation (Line(points={{7,-48},{-18,-48}},
                                  color={0,0,127}));
        connect(product3.y,signalVoltage. v) annotation (Line(points={{7,-78},{-52,-78}},
                                  color={0,0,127}));
        connect(firstOrder.y,product1. u2)
          annotation (Line(points={{44,7},{44,-12},{30,-12}},      color={0,0,127}));
        connect(product2.u2,firstOrder. y) annotation (Line(points={{30,-42},{44,-42},
                {44,7}},    color={0,0,127}));
        connect(product3.u2,firstOrder. y) annotation (Line(points={{30,-72},{44,-72},
                {44,7}},    color={0,0,127}));
        connect(firstOrder.u,add. y)
          annotation (Line(points={{44,30},{44,35}},     color={0,0,127}));
        connect(step1.y,add. u2) annotation (Line(points={{28,71},{28,68},{38,68},{38,
                58}},                           color={0,0,127}));
        connect(step2.y,add. u1) annotation (Line(points={{60,71},{60,68},{50,68},{50,
                58}},                           color={0,0,127}));
        connect(p, signalVoltage.p)
          annotation (Line(points={{-100,60},{-64,60},{-64,-68}}, color={0,0,255}));
        connect(p1, signalVoltage1.p)
          annotation (Line(points={{-100,0},{-30,0},{-30,-38}}, color={0,0,255}));
        connect(p2, signalVoltage2.p) annotation (Line(points={{-100,-60},{-78,-60},{-78,
                -4},{-14,-4},{-14,-8}}, color={0,0,255}));
        connect(signalVoltage2.n, ground4.p)
          annotation (Line(points={{-14,-28},{-14,-94},{-64,-94}}, color={0,0,255}));
        connect(signalVoltage1.n, ground4.p)
          annotation (Line(points={{-30,-58},{-30,-94},{-64,-94}}, color={0,0,255}));
        connect(signalVoltage.n, ground4.p)
          annotation (Line(points={{-64,-88},{-64,-94}}, color={0,0,255}));
        connect(resistor.n, signalVoltage.n)
          annotation (Line(points={{-76,-88},{-64,-88}}, color={0,0,255}));
        connect(resistor.p, signalVoltage.p)
          annotation (Line(points={{-76,-68},{-64,-68}}, color={0,0,255}));
        connect(resistor1.p, signalVoltage1.p)
          annotation (Line(points={{-46,-38},{-30,-38}}, color={0,0,255}));
        connect(resistor1.n, signalVoltage1.n)
          annotation (Line(points={{-46,-58},{-30,-58}}, color={0,0,255}));
        connect(resistor2.n, signalVoltage2.n)
          annotation (Line(points={{-24,-28},{-14,-28}}, color={0,0,255}));
        connect(resistor2.p, signalVoltage2.p)
          annotation (Line(points={{-24,-8},{-14,-8}}, color={0,0,255}));
        annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={0,0,255}), Text(
                extent={{-76,58},{88,-52}},
                textColor={0,0,255},
                textString="Grid")}));
      end GridWithFault;
    end GridComponents;
  end GFM;

  package SCRX9 "scrx9_dll"
    class SCRX9_DLL
      extends ExternalObject;

      function constructor
          output SCRX9_DLL scrx9_dll;
          external "C" scrx9_dll = init_scrx_model() annotation (Library="SCRX9",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end constructor;

      function destructor
          input SCRX9_DLL scrx9_dll;
          external "C" deinit_scrx_model(scrx9_dll) annotation (Library="SCRX9",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end destructor;

      annotation (Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={255,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.None), Text(
          extent={{-100,46},{98,-102}},
          textColor={238,46,47},
          textString="Class
")}));
    end SCRX9_DLL;

    model SCRX
      Modelica.Blocks.Interfaces.RealInput ETERM(start = 1) annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={100,50})));
      Modelica.Blocks.Interfaces.RealInput XADIFD(start = 1.325) annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={100,-50})));
      Modelica.Blocks.Interfaces.RealOutput EFD annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-110,0})));
      SCRX9_DLL scrx9_struct = SCRX9_DLL();
    algorithm
        Functions.update(
          scrx9_struct,
          time,
          1,
          ETERM,
          0,
          XADIFD,
          ETERM,
          0,
          0);
      EFD:=Functions.model_output(scrx9_struct);

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.None), Text(
              extent={{-78,48},{68,-48}},
              textColor={0,0,0},
              textString="SCRX9")}), Diagram(coordinateSystem(preserveAspectRatio=false)));
    end SCRX;

    package Functions
      function update
        input SCRX9_DLL scrx9_dll;
        input Real t;
        input Real vref;
        input Real ec;
        input Real vs;
        input Real ifd;
        input Real vt;
        input Real vuel;
        input Real voel;
        external "C" update_scrx_input(scrx9_dll,t,vref,ec,vs,ifd,vt,vuel,voel) annotation (Library="SCRX9",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end update;

      function model_output
        input SCRX9_DLL scrx9_dll;
        output Real out;
        external "C" out = model_calculate(scrx9_dll) annotation (Library="SCRX9",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end model_output;

      function get_time
        output Real out;
        external"C" out = get_sim_time() annotation (Library="SCRX9",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end get_time;

    function add_c
      input Real a;
      input Real b;
      output Real sum;
      external "C" sum = my_sum(a,b) annotation (Library="SCRX9",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end add_c;
    end Functions;

  end SCRX9;
end IEEE_CIGRE;
