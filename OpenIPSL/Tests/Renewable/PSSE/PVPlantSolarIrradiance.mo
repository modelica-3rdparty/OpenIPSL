within OpenIPSL.Tests.Renewable.PSSE;
model PVPlantSolarIrradiance
  "PV source in a SMIB system to test functionality of Irradiance to Power Add on"
  extends BaseClasses.SMIBAddOn;
  Electrical.Renewables.PSSE.PV pV(
    P_0=1500000,
    Q_0=-5665800,
    v_0=1,
    angle_0(displayUnit="deg") = 0.02574992,
    QFunctionality=1,
    PFunctionality=0,
    Irr2Pow=true,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1
      RenewableGenerator,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECB1
      RenewableController(vref0=1),
    redeclare OpenIPSL.Electrical.Renewables.PSSE.PlantController.REPCA1
      PlantController)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Electrical.Renewables.PSSE.AddOnBlocks.IrradianceToPower irradianceToPower(
    M_b(displayUnit="MV.A") = 100000000,
    Ypv(displayUnit="MW") = 1500000,
    Tcstc(displayUnit="degC") = 298.15,
    fpv=1,
    ap=0,
    SolarRadiationTable=[0.0,1000; 2,600; 3,700; 4,250; 5,1000],
    SolarArrayTemperatureTable=[0.0,25; 10,25])
    annotation (Placement(transformation(extent={{-92,-6},{-72,14}})));
equation
  connect(pV.pwPin, GEN1.p)
    annotation (Line(points={{-40,0},{-30,0}}, color={0,0,255}));
  connect(irradianceToPower.Ppv, pV.i2p)
    annotation (Line(points={{-71,4},{-62,4}}, color={0,0,127}));
  annotation (experiment(
      StopTime=5,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
Simulate for 5 seconds.
</p>
<p>This test system aims to show how to use IrradianceToPower block, an Add-On component that enables varying active power reference in the PV model based on irradiance levels. 
This capability is not found in the original version of the WECC-based renewable models.</p>
<p>Variables of interest:</p>
<ul>
<li><code>pV.RenewableGenerator.Pgen</code></li>
<li><code>pV.RenewableGenerator.Qgen</code></li>
<li><code>irradianceToPower.Ppv</code></li>
</ul>
</html>"));
end PVPlantSolarIrradiance;
